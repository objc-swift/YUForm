//
//  ShellKitSelectTableView.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "SheKit.h"

@interface ShellKitSelectTableView()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableDictionary  *isRegClass;
@end
@implementation ShellKitSelectTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        [self setUpView];
        [self initData];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    if(self)
    {
         [self setUpView];
         [self initData];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [_tableView setFrame:self.bounds];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setUpView
{
    _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self ;
    _tableView.backgroundColor = [UIColor redColor];
    [self addSubview:_tableView];
}

- (void)initData
{
    _tableViewDataSource = [[ShellKitSelectTableViewDataSource alloc]init];
    _isRegClass = [[NSMutableDictionary alloc]init];

}

- (BOOL)isNibExist:(Class)cls
{
    
    NSString *className =NSStringFromClass(cls);
    BOOL isNibExist = [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/%@.nib",[[NSBundle mainBundle]resourcePath],className]];
    return isNibExist;
}

#pragma mark tableview
- (void)reloadData
{
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _tableViewDataSource.sectionArrays[section].rowArrays.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _tableViewDataSource.sectionArrays.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShellKitTableViewCellModel * model = _tableViewDataSource.sectionArrays[indexPath.section].rowArrays[indexPath.row];
    return model.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    ShellKitSectionModel * model = _tableViewDataSource.sectionArrays[section];
    return model.sectionHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UITableViewHeaderFooterView<YUCheckBoxSectionDelegate> *  headView = nil;
    ShellKitSectionModel * sectionModel = _tableViewDataSource.sectionArrays[section] ;
    NSString * setcionID = NSStringFromClass(sectionModel.sectionCellStyleClass);
    headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:setcionID];
    if(headView == nil)
    {
        [tableView registerHeaderFooter:sectionModel.sectionCellStyleClass];
    }
    [headView shell_setModel:sectionModel];
    return headView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShellKitTableViewCellModel * model  = _tableViewDataSource.sectionArrays[indexPath.section].rowArrays[indexPath.row];
    ShellKitSectionModel * sectionModel = _tableViewDataSource.sectionArrays[indexPath.section] ;
    model.rowNumber = indexPath.row;
    NSString * cellId = NSStringFromClass(sectionModel.rowCellStyleClass);
    UITableViewCell<ShellKitSelectTableView > * cell= [tableView dequeueReusableCellWithIdentifier:cellId ];
    if(cell == nil)
    {
        [tableView registerCell:sectionModel.rowCellStyleClass];
        cell= [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    }
    [self reModifyCell:cell withModel:model];
    return cell;
}

- (void)reModifyCell:(UITableViewCell <ShellKitSelectTableView > * ) cell
        withModel:(ShellKitTableViewCellModel *)model
{
    if(model.isSelected)
    {
        NSAssert([cell respondsToSelector:@selector(shell_selectedStatus)], @"Cell 必须实现 shell_selectedStatus 方法");
        [cell shell_selectedStatus];
    }else
    {
        NSAssert([cell respondsToSelector:@selector(shell_unSelectStatus)], @"Cell 必须实现 shell_unSelectStatus 方法");
        [cell shell_unSelectStatus];
    }
        NSAssert([cell respondsToSelector:@selector(shell_setModel:)], @"Cell 必须实现 shell_setModel 方法");
        [cell shell_setModel:model];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShellKitSectionModel * sectionModel = _tableViewDataSource.sectionArrays[indexPath.section] ;
    ShellKitTableViewCellModel * rowmModel = sectionModel.rowArrays[indexPath.row];
    rowmModel.isSelected = !rowmModel.isSelected;
    NSMutableArray<NSIndexPath *> * updateIndexPaths = [[NSMutableArray alloc]initWithArray:@[indexPath]];
    
    // 点击后的状态
    if( rowmModel.isSelected == YES ) {
        if( !sectionModel.isCanMultipleChoice )
        {
                // 不可多选，将已选的取消选择，保证已经选择只存在一个
            for ( ShellKitTableViewCellModel * selectedRow in sectionModel.selectRowsSet )
            {
                selectedRow.isSelected = NO ;
                NSIndexPath * unSelectIndexPath =[NSIndexPath indexPathForRow:selectedRow.rowNumber inSection:indexPath.section];
                [updateIndexPaths addObject:unSelectIndexPath];
            }
            [sectionModel.selectRowsSet removeAllObjects];
        }
        [sectionModel.selectRowsSet addObject:rowmModel];
    }
    else
    {
        [sectionModel.selectRowsSet removeObject:rowmModel];
    }
    [_tableView reloadRowsAtIndexPaths:updateIndexPaths
                      withRowAnimation:UITableViewRowAnimationNone];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return nil;
}
@end

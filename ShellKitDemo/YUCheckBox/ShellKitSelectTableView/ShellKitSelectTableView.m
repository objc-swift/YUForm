//
//  ShellKitSelectTableView.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "SheKit.h"
@interface ShellKitSelectTableView()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UITextFieldDelegate>
@property (strong,nonatomic) NSMutableDictionary  *isRegClass;
@property (strong,nonatomic) UIView *curEnditingView;

@end
@implementation ShellKitSelectTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        [self setUpView];
        [self initData];
        [self startKeyboardObserve];
        
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
         [self startKeyboardObserve];
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

#pragma mark keyboard
- (void) stopKeyboardObserve{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];

}

- (void) startKeyboardObserve{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(transformView:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)transformView:(NSNotification *)aNSNotification
{

    
    //获取键盘弹出前的Rect
    NSValue *keyBoardBeginBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect=[keyBoardBeginBounds CGRectValue];
    
    //获取键盘弹出后的Rect
    NSValue *keyBoardEndBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect  endRect=[keyBoardEndBounds CGRectValue];
    
    //获取键盘位置变化前后纵坐标Y的变化值
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;
    
    NSLog(@"看看这个变化的Y值:%f",deltaY);
   
    
}
#pragma mark textField/text

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    _curEnditingView = textField;
    
    return YES;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    _curEnditingView = textView;
    return YES;
    
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
    UITableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:cellId ];
    if(cell == nil)
    {
        [tableView registerCell:sectionModel.rowCellStyleClass];
        cell= [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        if( [cell conformsToProtocol:@protocol(YUCheckBoxRowTextCellDelegate)] ) {
            UIView * inputView =  [cell performSelector:@selector(shell_inputView)];
            if( [inputView isKindOfClass:[UITextView class]] ) {
                ((UITextView *)inputView).delegate = self ;
            }else if( [inputView isKindOfClass:[UITextField class]] ) {
                ((UITextField *)inputView).delegate = self ;
            }
        }
    }
    [self reModifyCell:cell withModel:model];
    return cell;
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
#pragma mark logic
- (void)reModifyCell:(UITableViewCell  * ) cell
           withModel:(ShellKitTableViewCellModel *)model
{
    if(model.isSelected)
    {
        if( [cell respondsToSelector:@selector(shell_selectedStatus)] ){
            [cell performSelector:@selector(shell_selectedStatus)];
        }
    }else
    {
        if( [cell respondsToSelector:@selector(shell_unSelectStatus)] ) {
            
            [cell performSelector:@selector(shell_unSelectStatus)];
        }
    }
    if( [cell respondsToSelector:@selector(shell_setModel:)] ) {
        [cell performSelector:@selector(shell_setModel:) withObject:model];
    }
}


- (void)dealloc {
    [self stopKeyboardObserve];
    
}
@end

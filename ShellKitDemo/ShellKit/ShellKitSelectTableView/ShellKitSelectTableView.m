//
//  ShellKitSelectTableView.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ShellKitSelectTableView.h"

#import "ShellKitTableViewCellModel.h"

@interface ShellKitSelectTableView()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView * tableView;
@property (strong,nonatomic) Class itemCellClass;
@property (strong,nonatomic) Class sectionHeadClass ;

@end

@implementation ShellKitSelectTableView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if ( self ){
        [self setUpView];
        _tableViewDataSource = [[ShellKitSelectTableViewDataSource alloc]init];
        
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
         [self setUpView];
         _tableViewDataSource = [[ShellKitSelectTableViewDataSource alloc]init];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    [_tableView setFrame:self.bounds];
   
}

- (void)setUpView{
    _tableView = [[UITableView alloc]initWithFrame:self.bounds];
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}

/**
 cls 为cell的class
 带xib的cell 也调用这个方法
 注意：xib的文件名要与cell的文件名相同，例如 myCell.h myCell.m myCell.xib
 @param cls cell 的class
 */

- (void)registerViewClass:(Class)cls type:(CellType)type {
   
    if(type == CellTypeSelectItem){
        [self registerCell:cls];
        _itemCellClass = cls;
    }
    if(type == CellTypeSelectHead){
        _sectionHeadClass = cls;
    }
}

- (void)registerCell:(Class)cls {
    NSString * cellStr = NSStringFromClass(cls);
    UINib * nib = [UINib nibWithNibName:NSStringFromClass(cls) bundle:[NSBundle mainBundle]];
    if(nib){
        [_tableView registerNib:nib forCellReuseIdentifier:cellStr];
    }else{
        [_tableView registerClass:cls forCellReuseIdentifier:cellStr];
    }
}

#pragma mark tableview

- (void)reloadData {
    
    [_tableView reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tableViewDataSource.dataArrays.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShellKitTableViewCellModel * model = _tableViewDataSource.dataArrays[indexPath.row];
    return model.cellHeight;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShellKitTableViewCellModel * model =        _tableViewDataSource.dataArrays[indexPath.row];
    NSString * cellId = NSStringFromClass(_itemCellClass);
    UITableViewCell<ShellKitSelectTableView > * cell= [tableView dequeueReusableCellWithIdentifier:cellId ];

    if(model.isSelected){
        NSAssert([cell respondsToSelector:@selector(shell_selectedStatus)], @"Cell 必须实现 shell_selectedStatus 方法");
            [cell shell_selectedStatus];
    }else{
        NSAssert([cell respondsToSelector:@selector(shell_unSelectStatus)], @"Cell 必须实现 shell_unSelectStatus 方法");
        [cell shell_unSelectStatus];
    }
        NSAssert([cell respondsToSelector:@selector(shell_setModel:)], @"Cell 必须实现 shell_setModel 方法");
    [cell shell_setModel:model];
    return cell;
}




@end

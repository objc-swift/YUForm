//
//  ShellKitSelectTableView.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ShellKitSelectTableView.h"
@interface ShellKitSelectTableView()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView * tableView;

@end

@implementation ShellKitSelectTableView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        [self setUpView];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
         [self setUpView];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    [_tableView setFrame:self.bounds];
    
}
- (void)setUpView{
    _tableView = [[UITableView alloc]initWithFrame:self.bounds];
    [self addSubview:_tableView];
    
}

#pragma mark tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _tableViewDataSource.dataArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}
/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/

@end

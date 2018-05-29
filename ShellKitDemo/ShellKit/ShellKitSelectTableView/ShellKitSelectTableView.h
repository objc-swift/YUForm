//
//  ShellKitSelectTableView.h
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShellKitSelectTableViewDataSource.h"
@class ShellKitTableViewCellModel;
typedef NS_ENUM(NSUInteger, RegClassType) {
    RegClassTypeCell = 1 ,
    RegClassTypeHeadView = 2
};

@protocol ShellKitSelectTableView<NSObject>

@required
- (void)shell_setModel:(ShellKitTableViewCellModel *)model;
- (void)shell_selectedStatus;
- (void)shell_unSelectStatus;
@end

@interface ShellKitSelectTableView : UIView
@property (strong,nonatomic) ShellKitSelectTableViewDataSource * tableViewDataSource ;
@property (assign,nonatomic) BOOL isMultipleSelected;
@property (strong,nonatomic) UITableView * tableView;

- (void)reloadData ;
- (void)registerViewClass:(Class)cls type:(RegClassType)type;
@end

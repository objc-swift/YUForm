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
typedef NS_ENUM(NSUInteger, CellType) {
    CellTypeSelectItem = 1 ,
    CellTypeSelectHead = 2
};

@protocol ShellKitSelectTableView<NSObject>

@required
- (void)shell_setModel:(ShellKitTableViewCellModel *)model;
- (void)shell_selectedStatus;
- (void)shell_unSelectStatus;
@end

@interface ShellKitSelectTableView : UIView
@property (strong,nonatomic) ShellKitSelectTableViewDataSource * tableViewDataSource ;
@property (assign,nonatomic) BOOL isMultiple;
@property (strong,nonatomic) UITableView * tableView;

- (void)reloadData ;
- (void)registerViewClass:(Class)cls type:(CellType)type;
@end

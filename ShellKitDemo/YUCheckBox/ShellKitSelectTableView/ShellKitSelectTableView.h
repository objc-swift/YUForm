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

//选择项cell需要实现我
@protocol ShellKitSelectTableView<NSObject>
@required
- (void)shell_setModel:(ShellKitTableViewCellModel *) model;
- (void)shell_selectedStatus;
- (void)shell_unSelectStatus;
@end

//文本框需要实现我
@protocol YUCheckBoxRowTextCellDelegate<NSObject>
@required
- (void)shell_setModel:(ShellKitTableViewCellModel *) model;
- (UIView *)shell_inputView ;
@end

// sectionView 要实现我
@protocol YUCheckBoxSectionDelegate<NSObject>
@required
- (void)shell_setModel:(ShellKitSectionModel *) model;
@end



@interface ShellKitSelectTableView : UIView
@property (strong,nonatomic) ShellKitSelectTableViewDataSource * tableViewDataSource;
@property (strong,nonatomic) UITableView * tableView;
- (void)reloadData ;


@end

//
//  ShellKitSelectTableView.h
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShellKitSelectTableViewDataSource.h"
@protocol ShellKitSelectTableView<NSObject>
@required
- (void)shell_setModel:(id)model;
- (void)shell_selectedStatus;
- (void)shell_unSelectStatus;
@end

@interface ShellKitSelectTableView : UIView
@property (copy,nonatomic) NSString * regId;
@property (copy,nonatomic) Class cls;
@property (strong,nonatomic) ShellKitSelectTableViewDataSource * tableViewDataSource ;

- (void)registerCell:(Class)cls ;

@end

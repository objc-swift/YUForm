//
//  UITableView+YUTableViewAddition.h
//  ShellKitDemo
//
//  Created by yxy on 2018/6/8.
//  Copyright © 2018 jimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (YUTableViewAddition)

- (void)registerCell:(Class)cls;

- (void)registerHeaderFooter:(Class )cls;

@end

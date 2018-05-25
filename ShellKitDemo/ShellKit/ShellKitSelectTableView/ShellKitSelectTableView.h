//
//  ShellKitSelectTableView.h
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShellKitSelectTableViewDataSource.h"

@interface ShellKitSelectTableView : UIView
@property (strong,nonatomic) ShellKitSelectTableViewDataSource * tableViewDataSource ;
@end

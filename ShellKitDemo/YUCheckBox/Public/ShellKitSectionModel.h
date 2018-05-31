//
//  YUSectionModel.h
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShellKitTableViewCellModel;

@interface ShellKitSectionModel : NSObject

@property (strong,nonatomic) NSMutableArray <ShellKitTableViewCellModel *> * rowArrays ;
@property (strong,nonatomic) NSMutableSet   <ShellKitTableViewCellModel *> * selectRowsSet ;
@property (strong,nonatomic) id data ;
@property (assign,nonatomic) CGFloat sectionHeight ;
@property (assign,nonatomic) BOOL isCanMultipleChoice ;

@end

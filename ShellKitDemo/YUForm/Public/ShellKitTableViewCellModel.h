//
//  ShellKitTableViewCellModel.h
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ShellKitTableViewCellModel : NSObject
@property (strong,nonatomic) id data;
@property (assign,nonatomic) BOOL isSelected;
@property (assign,nonatomic) NSInteger rowNumber ;
@property (copy,nonatomic)   NSString * resultText ;
@property (assign,nonatomic) CGFloat cellHeight ;

- (void)yu_settingMake:(void(^)(ShellKitTableViewCellModel *))block;

@end

//
//  YUSectionModel.h
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShellKitTableViewCellModel;
@class YUCheckBoxSettingMaker;
@class YUFormCellModel;

@interface YUFormSectionModel : NSObject

@property (strong,nonatomic) NSMutableSet   <YUFormCellModel *> * selectRowsSet ;
@property (strong,nonatomic) NSMutableArray <YUFormCellModel *> * rowArrays ;
@property (strong,nonatomic) id data;
@property (assign,nonatomic) CGFloat sectionHeight;
@property (assign,nonatomic) BOOL isCanMultipleChoice;
@property (strong,nonatomic) Class rowCellStyleClass;
@property (strong,nonatomic) Class sectionCellStyleClass;
- (void)yu_settingMake:(void(^)(YUFormSectionModel *))block;
@end

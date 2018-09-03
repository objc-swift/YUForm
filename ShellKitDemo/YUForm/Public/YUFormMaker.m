//
//  YUFormMaker.m
//  ShellKitDemo
//
//  Created by jimi on 2018/9/3.
//  Copyright © 2018 jimi. All rights reserved.
//

#import "YUFormMaker.h"
#import "YUFormChoiceItemCell.h"
@implementation YUFormMaker
+ (YUFormSectionModel *)make_normalSectionModel:(NSString *)title items:(NSArray *)items {
    YUFormSectionModel *model = [[YUFormSectionModel alloc]init];
    [model yu_settingMake:^(YUFormSectionModel * this) {
        this.sectionCellStyleClass = YUFormHeadSection.class;
       
    }];
    return model;
}
@end

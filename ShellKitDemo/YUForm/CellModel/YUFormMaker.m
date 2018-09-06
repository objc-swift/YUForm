//
//  YUFormMaker.m
//  ShellKitDemo
//
//  Created by jimi on 2018/9/3.
//  Copyright © 2018 jimi. All rights reserved.
//

#import "YUFormMaker.h"
#import "YUFormChoiceItemCell.h"
#import "YUFormTextViewCell.h"
#import "YUFormTextFieldCell.h"
#import "YUFormChoiceHeadSection.h"
@implementation YUFormMaker

+ (YUFormSectionModel *)make_MultipleChoicesWithTitle:(NSString *)title items:(NSArray<NSString *> *)items {
    return [self make_ChoicesWithTitle:title items:items isMutiple:YES];
}
+ (YUFormSectionModel *)make_SignleChoicesWithTitle:(NSString *)title items:(NSArray<NSString *> *)items {
    return  [self make_ChoicesWithTitle:title items:items isMutiple:NO];
}


+ (YUFormSectionModel *)make_TextViewWithTitle:(NSString *)title {
    YUFormSectionModel *model = [[YUFormSectionModel alloc]init];
    [model yu_settingMake:^(YUFormSectionModel * this) {
        this.sectionCellStyleClass = YUFormNormalHeadSection.class;
        this.rowCellStyleClass = YUFormTextViewCell.class;
        this.data = title;
        NSMutableArray *rows = [[NSMutableArray alloc]init];
        YUFormCellModel *cellModel = [[YUFormCellModel alloc]init];
        [cellModel yu_settingMake:^(YUFormCellModel *this ) {
            
        }];
        [rows addObject:cellModel];
        model.rowArrays = rows;
    }];
    return model;
}

+ (YUFormSectionModel *)make_TextFieldWithTitle:(NSString *)title  {
    YUFormSectionModel *model = [[YUFormSectionModel alloc]init];
    [model yu_settingMake:^(YUFormSectionModel * this) {
        this.sectionCellStyleClass = YUFormNormalHeadSection.class;
        this.rowCellStyleClass = YUFormTextFieldCell.class;
        this.data = title;
        NSMutableArray *rows = [[NSMutableArray alloc]init];
        YUFormCellModel *cellModel = [[YUFormCellModel alloc]init];
        [cellModel yu_settingMake:^(YUFormCellModel *this ) {
            
        }];
        [rows addObject:cellModel];
        this.rowArrays = rows;
    }];
    return model;
}
+ (YUFormSectionModel *)make_ChoicesWithTitle:(NSString *)title items:(NSArray<NSString *> *)items isMutiple:(BOOL)isMutiple {
    YUFormSectionModel *model = [[YUFormSectionModel alloc]init];
    [model yu_settingMake:^(YUFormSectionModel * this) {
        // 设置section的基本信息
        this.sectionCellStyleClass = YUFormChoiceHeadSection.class;
        this.rowCellStyleClass = YUFormChoiceItemCell.class;
        this.data = title;
        this.isCanMultipleChoice = isMutiple;
        NSMutableArray *rows = [[NSMutableArray alloc]init];
        for( NSString *m_title in items ) {
            // 将选项字符串转化为model
            YUFormCellModel *cellModel =[[YUFormCellModel alloc]init];
            [cellModel yu_settingMake:^(YUFormCellModel * this) {
                this.data = m_title;
            }];
            [rows addObject:cellModel];
        }
        this.rowArrays = rows;
    }];
    return model;
}
@end

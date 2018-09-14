//
//  YUSectionModel.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "YUFormSectionModel.h"
#import "YUFormCellModel.h"
#import "YUFormChoiceItemCell.h"
#import "YUFormNormalHeadSection.h"
@interface YUFormSectionModel()
@end
@implementation YUFormSectionModel

- (void) yu_settingMake:(void(^)(YUFormSectionModel *))block {
    block(self);
    for( YUFormCellModel *cellModel in self.rowArrays ) {
        cellModel.inSectionModel = self;
    }
}

- (NSMutableArray<YUFormCellModel *> *) rowArrays {
    if( _rowArrays )return _rowArrays;
    _rowArrays = [[NSMutableArray<YUFormCellModel *> alloc]init];
    return _rowArrays;
}
- (id)init {
    
    self = [super init];
    if(self){
        _selectRowsSet = [[NSMutableSet <YUFormCellModel *> alloc]init];
        _sectionHeight = UITableViewAutomaticDimension;
    }
    return self;
}

- (Class)rowCellStyleClass {
    if( !_rowCellStyleClass ) {
        // 默认类型
        _rowCellStyleClass = YUFormChoiceItemCell.class;
    }
    return _rowCellStyleClass;
}

- (Class)sectionCellStyleClass {
    if( !_sectionCellStyleClass ) {
        _sectionCellStyleClass = YUFormNormalHeadSection.class;
    }
    return _sectionCellStyleClass;
}
@end

//
//  YUSectionModel.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "YUFormSectionModel.h"
#import "ShellKitTableViewCellModel.h"
#import "YUFormChoiceItemCell.h"
#import "YUFormHeadSection.h"
@interface YUFormSectionModel()
@end
@implementation YUFormSectionModel

- (void) yu_settingMake:(void(^)(YUFormSectionModel *))block {
    block(self);
}

- ( NSMutableArray<ShellKitTableViewCellModel *> *) rowArrays {
    if(_rowArrays)return _rowArrays;
    _rowArrays = [[NSMutableArray<ShellKitTableViewCellModel *> alloc]init];
    return _rowArrays;
}

- (id)init {
    
    self = [super init];
    if(self){
        _selectRowsSet = [[NSMutableSet <ShellKitTableViewCellModel *> alloc]init];
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
        _sectionCellStyleClass = YUFormHeadSection.class;
    }
    return _sectionCellStyleClass;
}
@end

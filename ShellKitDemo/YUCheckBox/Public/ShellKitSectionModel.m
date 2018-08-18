//
//  YUSectionModel.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ShellKitSectionModel.h"
#import "ShellKitTableViewCellModel.h"
#import "SheKitDefaultTableViewCell.h"
#import "SheKitSectionHeadView.h"
@interface ShellKitSectionModel()
@end
@implementation ShellKitSectionModel

- (void) yu_settingMake:(void(^)(ShellKitSectionModel *))block {
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
        _rowCellStyleClass = SheKitDefaultTableViewCell.class;
    }
    return _rowCellStyleClass;
}

- (Class)sectionCellStyleClass {
    if( !_sectionCellStyleClass ) {
        _sectionCellStyleClass = SheKitSectionHeadView.class;
    }
    return _sectionCellStyleClass;
}
@end

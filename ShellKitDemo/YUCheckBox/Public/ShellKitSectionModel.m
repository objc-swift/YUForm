//
//  YUSectionModel.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ShellKitSectionModel.h"
#import "ShellKitTableViewCellModel.h"

@interface ShellKitSectionModel()

@end

@implementation ShellKitSectionModel

- (id)init{
    
    self = [super init];
    if(self){
        _selectRowsSet = [[NSMutableSet <ShellKitTableViewCellModel *> alloc]init];
    }
    return self;
}
@end

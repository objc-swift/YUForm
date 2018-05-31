//
//  ShellKitTableViewCellModel.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ShellKitTableViewCellModel.h"

@implementation ShellKitTableViewCellModel
- (id)init{
    self = [super init];
    if(self){
        _cellHeight  = UITableViewAutomaticDimension;
        _rowNumber = - 1;
    }
    return self;
}
- (void)yu_settingMake:(void(^)(ShellKitTableViewCellModel *))block {
    block(self);
}
@end

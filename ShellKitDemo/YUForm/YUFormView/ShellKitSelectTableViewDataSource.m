//
//  ShellKitSelectTableViewDataSource.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ShellKitSelectTableViewDataSource.h"

@implementation ShellKitSelectTableViewDataSource

-(id)init{
    
    self =[super init];
    
    if(self){
        
        _sectionArrays =[[NSMutableArray alloc]init];
    }
    
    return self;
    
}

@end

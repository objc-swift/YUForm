//
//  ShellKitSelectTableViewDataSource.h
//  ShellKitDemo
//
//  Created by jimi on 2018/5/25.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShellKitSectionModel;


@protocol ShellKitSelectTableViewDataSourceDelegate<NSObject>

@required

@end

@interface ShellKitSelectTableViewDataSource : NSObject

@property (strong,nonatomic) NSMutableArray<ShellKitSectionModel *> *sectionArrays ;


@end

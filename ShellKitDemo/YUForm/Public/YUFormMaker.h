//
//  YUFormMaker.h
//  ShellKitDemo
//
//  Created by jimi on 2018/9/3.
//  Copyright © 2018 jimi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YUFormSectionModel.h"
#import "YUFormHeadSection.h"
@interface YUFormMaker : NSObject
+ (YUFormSectionModel *)make_normalSectionModel:(NSString *)title items:(NSArray *)items ;


@end

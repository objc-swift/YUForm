//
//  YUFormMaker.h
//  ShellKitDemo
//
//  Created by jimi on 2018/9/3.
//  Copyright © 2018 jimi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YUFormSectionModel.h"
#import "YUFormNormalHeadSection.h"
@interface YUFormMaker : NSObject

+ (YUFormSectionModel *)make_MultipleChoicesWithTitle:(NSString *)title items:(NSArray<NSString *> *)items;
+ (YUFormSectionModel *)make_SignleChoicesWithTitle:(NSString *)title items:(NSArray<NSString *> *)items;
+ (YUFormSectionModel *)make_TextViewWithTitle:(NSString *)title ;
+ (YUFormSectionModel *)make_TextFieldWithTitle:(NSString *)title ;
@end

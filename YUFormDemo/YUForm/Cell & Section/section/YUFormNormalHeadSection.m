//
//  SheKitSectionHeadView.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/29.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "YUFormNormalHeadSection.h"

@interface  YUFormNormalHeadSection()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation YUFormNormalHeadSection
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}
- (void)shell_setModel:(YUFormSectionModel *) model {
    [_titleLabel setText:model.data];
}
- (void)setUp{
    
}
@end

//
//  SheKitSectionHeadView.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/29.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "YUFormHeadSection.h"

@interface  YUFormHeadSection()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation YUFormHeadSection
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
    self.contentView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

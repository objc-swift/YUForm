//
//  SheKitSectionHeadView.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/29.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "SheKitSectionHeadView.h"


@interface  SheKitSectionHeadView()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end


@implementation SheKitSectionHeadView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setUp];
        
    }
    
    return self;
}
- (void)shell_setModel:(ShellKitSectionModel *) model{
    [_titleLabel setText:model.data];
    
}
- (void)setUp{
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

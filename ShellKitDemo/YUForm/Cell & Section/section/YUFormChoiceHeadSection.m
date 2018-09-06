//
//  YUFormChoiceHeadSection.m
//  ShellKitDemo
//
//  Created by jimi on 2018/9/5.
//  Copyright © 2018 jimi. All rights reserved.
//

#import "YUFormChoiceHeadSection.h"
#define kGreenTipBgColor [UIColor colorWithRed:231/255.0 green:252/255.0 blue:237/255.0 alpha:1]
#define kGreenFontColor [UIColor colorWithRed:68/255.0 green:216/255.0 blue:127/255.0 alpha:1]
#define kBlueTipBgColor [UIColor colorWithRed:236/255.0 green:244/255.0 blue:250/255.0 alpha:1]
#define kBlueFontColor [UIColor colorWithRed:68/255.0 green:155/255.0 blue:216/255.0 alpha:1]
@interface YUFormChoiceHeadSection()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *tipBgView;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@end
@implementation YUFormChoiceHeadSection
- (void)shell_setModel:(YUFormSectionModel *) model {
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:_titleLabel.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:6];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [_titleLabel.text length])];
    [_titleLabel setAttributedText:attributedString1];
    [_titleLabel sizeToFit];
    [_titleLabel setText:[NSString stringWithFormat:@"          %@",model.data]];
    if( model.isCanMultipleChoice ){
        // 多选
        _tipBgView.backgroundColor = kBlueTipBgColor;
        _tipLabel.textColor = kBlueFontColor;
        _tipLabel.text = @"多选";
    }else {
        _tipBgView.backgroundColor = kGreenTipBgColor;
        _tipLabel.textColor = kGreenFontColor;
        _tipLabel.text = @"单选";
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _tipBgView.layer.cornerRadius = 3.0 ;
}
@end

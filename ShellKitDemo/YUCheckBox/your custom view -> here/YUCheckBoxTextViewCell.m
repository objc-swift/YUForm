//
//  YUCheckBoxTextViewCell.m
//  ShellKitDemo
//
//  Created by jimi on 2018/7/9.
//  Copyright © 2018 jimi. All rights reserved.
//

#import "YUCheckBoxTextViewCell.h"

@interface YUCheckBoxTextViewCell()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end


@implementation YUCheckBoxTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _textView.layer.cornerRadius = 5.0;
    _textView.layer.masksToBounds = YES;
    _textView.layer.borderWidth = 0.5;
    _textView.layer.borderColor = [UIColor colorWithRed:157/255.0 green:157/255.0  blue:157/255.0  alpha:1].CGColor;
    
    // Initialization code
}
- (void)shell_setModel:(ShellKitTableViewCellModel *) model {
    
}
- (UIView *)shell_inputView {
    return _textView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

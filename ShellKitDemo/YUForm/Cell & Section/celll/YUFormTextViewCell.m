//
//  YUCheckBoxTextViewCell.m
//  ShellKitDemo
//
//  Created by jimi on 2018/7/9.
//  Copyright © 2018 jimi. All rights reserved.
//

#import "YUFormTextViewCell.h"

@interface YUFormTextViewCell()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end


@implementation YUFormTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _bgView.layer.cornerRadius = 5.0;
    _bgView.layer.masksToBounds = YES;
     self.contentView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
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

//
//  YUFormTextField.m
//  ShellKitDemo
//
//  Created by jimi on 2018/9/4.
//  Copyright © 2018 jimi. All rights reserved.
//

#import "YUFormTextFieldCell.h"
#import "SheKit.h"

@implementation YUFormTextFieldData


@end


@interface YUFormTextFieldCell()<YUCheckBoxRowTextCellDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@end
@implementation YUFormTextFieldCell
#pragma mark delegate
- (void)shell_setModel:(YUFormCellModel *) model {
    if( [model.data isKindOfClass:YUFormTextFieldData.class] ) {
        
    }
}
- (UIView *)shell_inputView {
    return _textField;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _bgView.layer.cornerRadius = 5.0;
    _bgView.layer.borderWidth = 0.5;
    _bgView.layer.borderColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1].CGColor;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

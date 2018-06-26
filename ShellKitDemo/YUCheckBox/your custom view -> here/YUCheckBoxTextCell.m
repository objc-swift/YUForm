//
//  YUCheckBoxTextCell.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/31.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "YUCheckBoxTextCell.h"
@interface YUCheckBoxTextCell()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
@implementation YUCheckBoxTextCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)shell_setModel:(ShellKitTableViewCellModel *) model {
    
    
}
- (UIView *)shell_inputView {
    
    return _textField;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  SheKitDefaultTableViewCell.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "YUFormChoiceItemCell.h"

@interface YUFormChoiceItemCell()
@property (weak, nonatomic) IBOutlet UILabel *selectStatus;
@property (weak, nonatomic) IBOutlet UIImageView *selectImg;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end
@implementation YUFormChoiceItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _bgView.layer.masksToBounds = YES;
    _bgView.layer.cornerRadius = _bgView.frame.size.height / 2.0 ;
    self.contentView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    
    // Initialization code
}

- (void)shell_setModel:(ShellKitTableViewCellModel *)model {
    NSString * str = (NSString *) model.data;
    [_label setText:str];
}

- (void)shell_selectedStatus {
    [_selectStatus setText:@"选中"];
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ShellKitBundle" ofType:@"bundle"];
    NSString *imgPath= [bundlePath stringByAppendingPathComponent:@"s_ed@2x.png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imgPath];
    [_selectImg setImage:image];
    [_bgView setBackgroundColor:[UIColor colorWithRed:68/255.0 green:216/255.0 blue:127/255.0 alpha:1]];
    [_label setTextColor:[UIColor whiteColor]];
    
//    _bgView.layer.borderColor = [UIColor colorWithRed:93/255.0 green:142/255.0 blue:226/255.0 alpha:1].CGColor;
}

- (void)shell_unSelectStatus {
    [_selectStatus setText:@"未选中"];
    [_selectImg setImage:nil];
    [_bgView setBackgroundColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
    [_label setTextColor:[UIColor blackColor]];
    
//     _bgView.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end

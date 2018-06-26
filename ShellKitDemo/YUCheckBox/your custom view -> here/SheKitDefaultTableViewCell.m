//
//  SheKitDefaultTableViewCell.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "SheKitDefaultTableViewCell.h"

@interface SheKitDefaultTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *selectStatus;
@property (weak, nonatomic) IBOutlet UIImageView *selectImg;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end
@implementation SheKitDefaultTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _bgView.layer.masksToBounds = YES;
    _bgView.layer.cornerRadius = 5.0 ;
    
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
}

- (void)shell_unSelectStatus {
    [_selectStatus setText:@"未选中"];
    [_selectImg setImage:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end

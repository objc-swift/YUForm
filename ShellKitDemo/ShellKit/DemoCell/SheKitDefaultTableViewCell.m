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

@end
@implementation SheKitDefaultTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)shell_setModel:(ShellKitTableViewCellModel *)model{
    
}
- (void)shell_selectedStatus{
     [_selectStatus setText:@"选中"];
     [_selectStatus setTextColor:[UIColor redColor]];
}
- (void)shell_unSelectStatus{
      [_selectStatus setText:@"未选中"];
      [_selectStatus setTextColor:[UIColor blackColor]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end

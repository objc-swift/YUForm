//
//  ViewController.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ViewController.h"
#import "SheKit.h"
#import "YUFormChoiceItemCell.h"
#import "YUFormCellModel.h"
#import "YUFormNormalHeadSection.h"
#import "YUFormTextViewCell.h"
#import "YUFormTextFieldCell.h"
#import "YUFormChoiceHeadSection.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet YUForm *tableVie;

@property (weak, nonatomic) IBOutlet UIButton *ss;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YUFormSectionModel*m0 = [YUFormMaker make_TextFieldWithTitle:@"手机号" keyboardType:UIKeyboardTypePhonePad placeholder:@"请输入您的手机号码"];
    YUFormSectionModel*m1 = [YUFormMaker make_TextFieldWithTitle:@"密码" keyboardType:UIKeyboardTypeASCIICapable placeholder:@"请输入密码"];
    
    YUFormSectionModel *model0 = [YUFormMaker make_MultipleChoicesWithTitle:@"你喜欢什么运动？" items:@[@"游泳",@"健身",@"羽毛球",@"乒乓球",@"足球"]];
    YUFormSectionModel *model1_1 = [YUFormMaker make_SignleChoicesWithTitle:@"你的工资是多少钱" items:@[@"500-300",@"900-2000",@"2000-50000",@"7000-8000"]];
        YUFormSectionModel *kmodel1_1 = [YUFormMaker make_SignleChoicesWithTitle:@"你的工资是多少钱" items:@[@"500-300",@"900-2000",@"2000-50000",@"7000-8000"]];
            YUFormSectionModel *mkmodel1_1 = [YUFormMaker make_SignleChoicesWithTitle:@"你的工资是多少钱" items:@[@"500-300",@"900-2000",@"2000-50000",@"7000-8000"]];
    YUFormSectionModel *model1 = [YUFormMaker make_TextViewWithTitle:@"请输入你的的感想～"];

    
    [_tableVie addSectionModel:m0];
    [_tableVie addSectionModel:m1];
    [_tableVie addSectionModel:model0];
    [_tableVie addSectionModel:model1_1];
    [_tableVie addSectionModel:model1];
     [_tableVie addSectionModel:kmodel1_1];
     [_tableVie addSectionModel:mkmodel1_1];
    [_tableVie reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

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
#import "YUFormHeadSection.h"
#import "YUFormTextViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YUForm *tableVie;

@property (weak, nonatomic) IBOutlet UIButton *ss;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof (self) se =self;
    
 
    
    NSArray * arr =@[@"A、含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质含蛋白质",@"B、含脂肪",@"C、含糖 ",@"D、水分不够"];
    NSArray * arr2 =@[@"A、法治生活",@"B、法治国家",@"C、法治政府",@"D、法治社会"];
    YUFormSectionModel * section0 = [[YUFormSectionModel alloc]init];
    [section0 yu_settingMake:^(YUFormSectionModel * this) {
        this.data = @"  1.吃冰淇淋不解渴主要是因为它";
        this.rowCellStyleClass =  YUFormChoiceItemCell.class;
        this.sectionCellStyleClass = YUFormHeadSection.class;
        NSMutableArray * m = [[NSMutableArray alloc]init];
        for(int i = 0 ; i < 4 ; i ++ ){
            ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
            [model yu_settingMake:^(ShellKitTableViewCellModel * this) {
                this.data = arr[i];
            }];
            [m addObject:model];
        }
        this.rowArrays = m;
    }];
    YUFormSectionModel * section1 = [[YUFormSectionModel alloc]init];
    [section1 yu_settingMake:^(YUFormSectionModel * this) {
        this.data = @"  2.科学立法、严格执法、公正司法、全民守法深入推进，( )、( )、( )建设相互促进，中国特色社会主义法治体系日益完善，全社会法治观念明显增强。  ";
        this.isCanMultipleChoice = YES;

        this.rowCellStyleClass =  YUFormChoiceItemCell.class;
        this.sectionCellStyleClass = YUFormHeadSection.class;
        for(int i = 0 ; i < 4 ; i ++ ){
            ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
            [model yu_settingMake:^(ShellKitTableViewCellModel * this) {
                this.data = arr2[i];
            }];
            [this.rowArrays addObject:model];
        }
    }];
    YUFormSectionModel * section2 = [[YUFormSectionModel alloc]init];
    [section2 yu_settingMake:^(YUFormSectionModel * this) {
        this.data = @"性别";
        this.isCanMultipleChoice = NO;
        this.rowCellStyleClass =  YUFormChoiceItemCell.class;
        this.sectionCellStyleClass =YUFormHeadSection.class;
        ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
        [model yu_settingMake:^(ShellKitTableViewCellModel * this) {
                this.data = @"男";
            }];
        ShellKitTableViewCellModel * model1 = [[ShellKitTableViewCellModel alloc]init];
        [model1 yu_settingMake:^(ShellKitTableViewCellModel * this) {
            this.data = @"女";
        }];
        [this.rowArrays addObject:model];
        [this.rowArrays addObject:model1];
    }];
    
    YUFormSectionModel * section3 = [[YUFormSectionModel alloc]init];
    [section3 yu_settingMake:^(YUFormSectionModel * this) {
        
        this.data = @"  给下面这则新闻拟一个恰当的标题。（不超过15个字）（3分）\n\n  据华西都市报，地震发生时，芦山双石镇33岁的产妇朱开慧眼见房顶不断砸下瓦砾、石块，她拉着11岁的儿子躲到床下，一直跪着，身体弓起，将床撑起，最大限度保证“两个孩子”的安全…昨晚，被送往成都的朱开慧，剖腹产下男孩，母子平安!";
        this.isCanMultipleChoice = NO;
        this.rowCellStyleClass =  YUFormTextViewCell.class;
        this.sectionCellStyleClass =YUFormHeadSection.class;
        ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
        [model yu_settingMake:^(ShellKitTableViewCellModel * this) {
            this.data = @"请输入你想写的话...";
        }];
        [this.rowArrays addObject:model];
    }];
    
    YUFormSectionModel * section4 = [[YUFormSectionModel alloc]init];
    [section4 yu_settingMake:^(YUFormSectionModel * this) {
        
        this.data = @"  给下面这则新闻拟一个恰当的标题。（不超过15个字）（3分）\n\n  据华西都市报，地震发生时，芦山双石镇33岁的产妇朱开慧眼见房顶不断砸下瓦砾、石块，她拉着11岁的儿子躲到床下";
        this.isCanMultipleChoice = NO;
        this.rowCellStyleClass =  YUFormTextViewCell.class;
        this.sectionCellStyleClass =YUFormHeadSection.class;
        ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
        [model yu_settingMake:^(ShellKitTableViewCellModel * this) {
            this.data = @"请输入你想写的话...";
        }];
        [this.rowArrays addObject:model];
    }];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section0];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section1];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section2];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section3];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section4];
    [_tableVie reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

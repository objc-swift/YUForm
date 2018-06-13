//
//  ViewController.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ViewController.h"
#import "SheKit.h"
#import "SheKitDefaultTableViewCell.h"
#import "SheKitSectionHeadView.h"
#import "YUCheckBoxTextCell.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ShellKitSelectTableView *tableVie;
@property (weak, nonatomic) IBOutlet UIButton *ss;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    NSArray * arr =@[@"A 3-4K ",@"B 4-7K",@"8K-10K ",@"D 10K+"];
    NSArray * arr2 =@[@"本科",@"大专",@"高中",@"初中及以下"];
    ShellKitSectionModel * section0 = [[ShellKitSectionModel alloc]init];
    [section0 yu_settingMake:^(ShellKitSectionModel * this) {
        this.data = @"您现在月薪是多少？";
        this.isCanMultipleChoice = YES;
        this.sectionHeight = 45 ;
        this.rowCellStyleClass =  SheKitDefaultTableViewCell.class;
        this.sectionCellStyleClass = SheKitSectionHeadView.class;
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
    
    ShellKitSectionModel * section1 = [[ShellKitSectionModel alloc]init];
    [section1 yu_settingMake:^(ShellKitSectionModel * this) {
        
        this.data = @"您现在学历是什么？";
        this.isCanMultipleChoice = NO;
        this.sectionHeight = 45 ;
        this.rowCellStyleClass =  SheKitDefaultTableViewCell.class;
        this.sectionCellStyleClass = SheKitSectionHeadView.class;
        for(int i = 0 ; i < 4 ; i ++ ){
            ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
            [model yu_settingMake:^(ShellKitTableViewCellModel * this) {
                this.data = arr2[i];
            }];
            [this.rowArrays addObject:model];
        }

    }];
    
    ShellKitSectionModel * section2 = [[ShellKitSectionModel alloc]init];
    [section2 yu_settingMake:^(ShellKitSectionModel * this) {
        
        this.data = @"给我们提提意见";
        this.isCanMultipleChoice = NO;
        this.sectionHeight = 45 ;
        this.rowCellStyleClass =  YUCheckBoxTextCell.class;
        this.sectionCellStyleClass =SheKitSectionHeadView.class;
        ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
        [model yu_settingMake:^(ShellKitTableViewCellModel * this) {
                this.data = @"请输入你想写的话...";
            }];
        [this.rowArrays addObject:model];
    }];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section0];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section1];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section2];
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

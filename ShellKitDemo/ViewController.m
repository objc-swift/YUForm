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
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ShellKitSelectTableView *tableVie;
@property (weak, nonatomic) IBOutlet UIButton *ss;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tableVie registerViewClass:SheKitDefaultTableViewCell.class type:RegClassTypeCell];
    [_tableVie registerViewClass:SheKitSectionHeadView.class type:RegClassTypeHeadView];
    NSMutableArray * m = [[NSMutableArray alloc]init];
    
    NSArray * arr =@[@"A 3-4K ",@"B 4-7K",@"8K-10K ",@"D 10K+" ];
    NSArray * arr2 =@[@"本科",@"大专",@"高中",@"初中及以下" ];
    
    ShellKitSectionModel * section0 = [[ShellKitSectionModel alloc]init];
    section0.sectionHeight = 30 ;
    section0.isCanMultipleChoice = YES;
    section0.data = @"您现在月薪是多少？";
    for(int i = 0 ; i < 4 ; i ++ ){
        ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
        model.data = arr[i];
        [m addObject:model];
    }
    section0.rowArrays = m;
    ShellKitSectionModel * section1 = [[ShellKitSectionModel alloc]init];
    section1.sectionHeight = 30 ;
    NSMutableArray * m2 = [[NSMutableArray alloc]init];
    for(int i = 0 ; i < 4 ; i ++ ){
        ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
        model.data = arr2[i];
        [m2 addObject:model];
    }
    section1.rowArrays = m2 ;
    section1.data = @"您的学历是什么？";
    [_tableVie.tableViewDataSource.sectionArrays addObject:section0];
    [_tableVie.tableViewDataSource.sectionArrays addObject:section1];
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

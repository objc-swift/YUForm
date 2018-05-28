//
//  ViewController.m
//  ShellKitDemo
//
//  Created by jimi on 2018/5/28.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ViewController.h"
#import "ShellKit/SheKit.h"
#import "SheKitDefaultTableViewCell.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ShellKitSelectTableView *tableVie;
@property (weak, nonatomic) IBOutlet UIButton *ss;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableVie registerViewClass:SheKitDefaultTableViewCell.class type:CellTypeSelectItem];
    NSMutableArray * m = [[NSMutableArray alloc]init];
    for(int i = 0 ; i < 10 ; i ++ ){
        ShellKitTableViewCellModel * model = [[ShellKitTableViewCellModel alloc]init];
        [m addObject:model];
    }
    ShellKitSectionModel * section0 = [[ShellKitSectionModel alloc]init];
    section0.rowArrays = m;
    
    ShellKitSectionModel * section1 = [[ShellKitSectionModel alloc]init];
    section1.rowArrays = m ;
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

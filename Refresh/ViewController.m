//
//  ViewController.m
//  Refresh
//
//  Created by txx on 16/12/7.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "ViewController.h"
#import "CustomRefreshViewController.h"
#import "MJRefresh.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self ;
    _tableView.dataSource = self ;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self MjDefaultRefresh];
//    [self MjDefaultRefreshBlock];
}
-(void)MjDefaultRefreshBlock
{
    __weak typeof(self) weakSelf = self ;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"upload block");
        [weakSelf performSelector:@selector(stop) withObject:nil afterDelay:3];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"downMore block");
        [weakSelf performSelector:@selector(stop) withObject:nil afterDelay:3];
    }];
}
-(void)MjDefaultRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(upLoad)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(downMore)];
}
-(void)upLoad
{
    NSLog(@"upload");
    [self performSelector:@selector(stop) withObject:nil afterDelay:3];
}
-(void)downMore
{
    NSLog(@"downmore");
    [self performSelector:@selector(stop) withObject:nil afterDelay:3];
}
-(void)stop
{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld--%ld",(long)indexPath.section,(long)indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[CustomRefreshViewController alloc] init] animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

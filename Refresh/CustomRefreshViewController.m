//
//  CustomRefreshViewController.m
//  Refresh
//
//  Created by txx on 16/12/7.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "CustomRefreshViewController.h"
#import "TXRefreshGifHeader.h"
#import "TXRefreshFooter.h"

@interface CustomRefreshViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CustomRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"custom refresh";
    _tableView.dataSource = self ;
    _tableView.delegate = self ;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    

    
    self.tableView.mj_header = [TXRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(upload)];
    
    self.tableView.mj_footer = [TXRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(downmore)];

}
-(void)upload
{
    NSLog(@"upload");
    [self performSelector:@selector(stop) withObject:nil afterDelay:3];
}
-(void)downmore
{
    NSLog(@"downmore");
    [self performSelector:@selector(stop) withObject:nil afterDelay:3];
}
-(void)stop
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld==%ld",(long)indexPath.section,(long)indexPath.row];
    return cell;
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

//
//  TXRefreshFooter.m
//  Refresh
//
//  Created by txx on 16/12/7.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TXRefreshFooter.h"

@implementation TXRefreshFooter

/**  初始化 */
- (void)prepare
{
    [super prepare];
    
    self.stateLabel.textColor = [UIColor grayColor];
    [self setTitle:@"向上拉加载更多内容喔..." forState:MJRefreshStateIdle];
    [self setTitle:@"正在连接网络加载中...." forState:MJRefreshStateRefreshing];
    
    UISwitch *swith = [[UISwitch alloc] init];
    [self addSubview:swith];
    
    UIImageView *logoView = [[UIImageView alloc] init];
    logoView.image = [UIImage imageNamed:@"meinv02"];
    [self addSubview:logoView];
    self.logoView = logoView;
}

/**
 *  摆放子控件
 */
- (void)placeSubviews
{
    [super placeSubviews];
    
//    self.logoView.frame.origin.x = 0;
//    self.logoView.y = self.height;
//    self.logoView.width = self.width;
//    self.logoView.height = 100;
}
@end

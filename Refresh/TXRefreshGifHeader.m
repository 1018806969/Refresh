//
//  TXRefreshGifHeader.m
//  Refresh
//
//  Created by txx on 16/12/7.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TXRefreshGifHeader.h"

@implementation TXRefreshGifHeader

-(void)prepare
{
    [super prepare];
    
    NSArray *idleImgs = @[[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"]];
    NSArray *pullingImgs = @[[UIImage imageNamed:@"2"]];
    NSArray *refreshingImgs = @[[UIImage imageNamed:@"3"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"3"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"3"],[UIImage imageNamed:@"4"]];
    [self setImages:idleImgs forState:MJRefreshStateIdle];
    [self setImages:pullingImgs forState:MJRefreshStatePulling];
    [self setImages:refreshingImgs forState:MJRefreshStateRefreshing];
    
#pragma mark  --------不同状态下的标题的内容、字体大小、字体颜色
    
    [self setTitle:@"1" forState:MJRefreshStateIdle];
    [self setTitle:@"2" forState:MJRefreshStatePulling];
    [self setTitle:@"3" forState:MJRefreshStateRefreshing];
    self.stateLabel.font = [UIFont systemFontOfSize:20];
    self.lastUpdatedTimeLabel.textColor = [UIColor redColor];
#pragma mark  ---------隐藏文字内容控件
    // hidden update time
    //    gifHeader.lastUpdatedTimeLabel.hidden = YES ;
    // hidden refresh state
    //    gifHeader.stateLabel.hidden = YES ;

}
@end

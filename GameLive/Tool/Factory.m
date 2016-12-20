//
//  Factory.m
//  GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Factory.h"

@implementation Factory
+ (void)addBackItemForVC:(UIViewController *)vc{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回-默认.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.27867.000.00.@1x"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回-按下.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.48267.000.00.@1x"] forState:UIControlStateHighlighted];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    UIBarButtonItem *speaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    speaceItem.width = 15;
    vc.navigationItem.leftBarButtonItems = @[backItem,speaceItem];
}
+ (void)addSearchItemForVC:(UIViewController *)vc clickedHandler:(void(^)())handler{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"搜索-默认.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.21025.000.00.@1x"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"搜索-按下.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.41425.000.00.@1x"] forState:UIControlStateHighlighted];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    UIBarButtonItem *speaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    speaceItem.width = 15;
    vc.navigationItem.rightBarButtonItems = @[backItem,speaceItem];
}
+ (void)addJumpForVC:(UIViewController *)vc andBtn:(NSString *)btnName clickedHandler:(void(^)())handler{
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [clickBtn setTitle:btnName forState:UIControlStateNormal];
    [clickBtn setTitle:btnName forState:UIControlStateHighlighted];
    clickBtn.frame = CGRectMake(0, 0, 47, 47);
    [clickBtn setTintColor:[UIColor whiteColor]];
    [clickBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:clickBtn];
    UIBarButtonItem *speaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    speaceItem.width = 25;
    vc.navigationItem.rightBarButtonItems = @[backItem,speaceItem];
}
@end

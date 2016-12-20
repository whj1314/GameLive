//
//  MyBarController.m
//  GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyBarController.h"
#import "ColumuViewController.h"
#import "RecomViewController.h"
#import "MineViewController.h"
#import "LiveViewController.h"
@import AVKit;
@import AVFoundation;
@interface MyBarController ()
@property (nonatomic) ColumuViewController *colVc;
@property (nonatomic) RecomViewController *reVc;
@property (nonatomic) MineViewController *minVc;
@property (nonatomic) LiveViewController *liVc;
@end

@implementation MyBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //bar不透明
    [UITabBar appearance].translucent = NO;
    [UINavigationBar appearance].translucent = NO;
    
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:255/255.0 green:50/255.0 blue:41/255.0 alpha:1.0];
    //颜色变白
    [UINavigationBar appearance].barStyle = UIBarStyleBlackOpaque;
    
    [UITabBar appearance].tintColor = [UIColor colorWithRed:255/255.0 green:50/255.0 blue:41/255.0 alpha:1.0];

    UINavigationController *navi1 = [[UINavigationController alloc]initWithRootViewController:self.colVc];
    UINavigationController *navi2 = [[UINavigationController alloc]initWithRootViewController:self.reVc];
    UINavigationController *navi3 = [[UINavigationController alloc]initWithRootViewController:self.minVc];
    UINavigationController *navi4 = [[UINavigationController alloc]initWithRootViewController:self.liVc];
    self.viewControllers = @[navi2,navi1,navi4,navi3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (ColumuViewController *)colVc {
	if(_colVc == nil) {
        UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (long)((self.view.frame.size.width) - 4*10)/3;
        CGFloat height = width +50;
        layout.itemSize = CGSizeMake(width, height);
		_colVc = [[ColumuViewController alloc] initWithCollectionViewLayout:layout];
       _colVc.tabBarItem.image = [UIImage imageNamed:@"栏目-默认.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.45456.000.00.@1x"];
        _colVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"栏目-焦点.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.10829.000.00.@1x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _colVc.title = @"栏目";
	}
	return _colVc;
}

- (RecomViewController *)reVc {
	if(_reVc == nil) {
        UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (long)((self.view.frame.size.width) - 3*10)/2;
        CGFloat height = width - 50 ;
//        layout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 30); //设置collectionView头视图的大小
        layout.itemSize = CGSizeMake(width, height);
		_reVc = [[RecomViewController alloc] initWithCollectionViewLayout:layout];
        _reVc.tabBarItem.image = [UIImage imageNamed:@"推荐-默认.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.54283.000.00.@1x"];
        _reVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"推荐-焦点.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.19656.000.00.@1x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _reVc.title = @"推荐";
	}
	return _reVc;
}

- (MineViewController *)minVc {
	if(_minVc == nil) {
		_minVc = [[MineViewController alloc] initWithStyle:UITableViewStyleGrouped];
        _minVc.tabBarItem.image = [UIImage imageNamed:@"我的-默认.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.45662.000.00.@1x"];
        _minVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"我的-焦点.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.11035.000.00.@1x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _minVc.title = @"我的";
	}
	return _minVc;
}

- (LiveViewController *)liVc {
	if(_liVc == nil) {
        UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (long)((self.view.frame.size.width) - 3*10)/2;
        CGFloat height = width - 50 ;
        layout.itemSize = CGSizeMake(width, height);
		_liVc = [[LiveViewController alloc] initWithCollectionViewLayout:layout];
        _liVc.tabBarItem.image = [UIImage imageNamed:@"发现-默认.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.53246.000.00.@1x"];
        _liVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"发现-焦点.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.18619.000.00.@1x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _liVc.title = @"直播";
	}
	return _liVc;
}

@end

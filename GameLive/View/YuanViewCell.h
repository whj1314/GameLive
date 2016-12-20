//
//  YuanViewCell.h
//  GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YuanViewCell;
@protocol YuanViewDataSource <NSObject>
@required
- (NSInteger)numberOfItemsForYuan:(YuanViewCell *)yuan;
- (NSString *)yuanHM:(YuanViewCell *)rocm titleForIndex:(NSInteger)index;
- (NSURL *)yuanHM:(YuanViewCell *)rocm iconURLForIndex:(NSInteger)index;
@end

@protocol YuanViewDelegate <NSObject>
@optional  //可选实现
- (void)yuanHM:(YuanViewCell *)rocm didSelectedItemAtIndex:(NSInteger)index;
@end

@interface YuanViewCell : UICollectionViewCell<iCarouselDataSource,iCarouselDelegate>

//刷新页面
- (void)reloadData;

//为了防止循环引用问题, 一定要使用weak修饰
@property (nonatomic, weak) id<YuanViewDelegate> delegate;
@property (nonatomic, weak) id<YuanViewDataSource> dataSource;

@property (nonatomic) iCarousel *ic;

@property (nonatomic) NSTimer *timer;
@property (nonatomic) BOOL autoScroll;
@property (nonatomic) NSTimeInterval duration;




@end

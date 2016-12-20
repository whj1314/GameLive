//
//  RocmHeaderModel.h
//  GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RocmHeaderModel;
@protocol HeaderViewDataSource <NSObject>
@required
- (NSInteger)numberOfItems:(RocmHeaderModel *)rocm;
- (NSString *)rocmHM:(RocmHeaderModel *)rocm titleForIndex:(NSInteger)index;
- (NSURL *)rocmHM:(RocmHeaderModel *)rocm iconURLForIndex:(NSInteger)index;
@end

@protocol HeaderViewDelegate <NSObject>
@optional  //可选实现
- (void)rocmHM:(RocmHeaderModel *)rocm didSelectedItemAtIndex:(NSInteger)index;
@end

@interface RocmHeaderModel : UICollectionViewCell<iCarouselDataSource,iCarouselDelegate>

//刷新页面
- (void)reloadData;

//为了防止循环引用问题, 一定要使用weak修饰
@property (nonatomic, weak) id<HeaderViewDelegate> delegate;
@property (nonatomic, weak) id<HeaderViewDataSource> dataSource;

@property (nonatomic) iCarousel *ic;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UIView *maskView;
@property (nonatomic) UIPageControl *page;
@property (nonatomic) NSTimer *timer;
@property (nonatomic) BOOL autoScroll;
@property (nonatomic) NSTimeInterval duration;
@end

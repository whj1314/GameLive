//
//  RocmHeaderModel.m
//  GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RocmHeaderModel.h"

@implementation RocmHeaderModel
- (void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    //判断当前是否是自动滚动状态. 只有是, 才滚动
    self.autoScroll = _autoScroll;
}

- (void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    //让之前的timer也失效
    [_timer invalidate]; //失效, 停止
    _timer = nil;
    
    if (autoScroll) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
    }
}


#pragma mark - ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    //下方写法有风险, 一旦_dataSource指向的对象, 没有实现numberOfItems:方法, 就会崩溃
    if ([_dataSource respondsToSelector:@selector(numberOfItems:)]) {
        return [_dataSource numberOfItems:self];
    }
    return 0;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSource respondsToSelector:@selector(rocmHM:iconURLForIndex:)]) {
        NSURL *iconURL = [_dataSource rocmHM:self iconURLForIndex:index];
        [((UIImageView *)view) setImageURL:iconURL];
    }
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    //必须判断, 如果代理方实现了某个方法才调用
    if ([_delegate respondsToSelector:@selector(rocmHM:didSelectedItemAtIndex:)]) {
        [_delegate rocmHM:self didSelectedItemAtIndex:index];
    }
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pageC.currentPage = carousel.currentItemIndex;
    if ([_dataSource respondsToSelector:@selector(rocmHM:titleForIndex:)]) {
        self.titleLb.text = [_dataSource rocmHM:self titleForIndex:_ic.currentItemIndex];
    }
}

- (void)reloadData{
    [self.ic reloadData];
    if ([_dataSource respondsToSelector:@selector(rocmHM:titleForIndex:)]) {
        self.titleLb.text = [_dataSource rocmHM:self titleForIndex:_ic.currentItemIndex];
    }
    if ([_dataSource respondsToSelector:@selector(numberOfItems:)]) {
        self.pageC.numberOfPages = [_dataSource numberOfItems:self];
    }
    self.pageC.currentPage = _ic.currentItemIndex;
}

#pragma mark - LifeCycle 生命周期
- (void)setFrame:(CGRect)frame{
    //防止别人手动修改frame
    CGFloat width = frame.size.width;
    CGFloat height = width * 197 / 320 + 30;
    super.frame = CGRectMake(0, 0, width, height);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    //pic: 320 * 197
    CGFloat width = frame.size.width;
    CGFloat height = width * 197 / 320 + 30;
    self = [super initWithFrame:CGRectMake(0, 0, width, height)];
    if (self) {
        [self pageC];
        [self maskView];
        [self ic];
        [self titleLb];
        //先后顺序必须是先设置时间, 再设置自动滚动
        _duration = 3.0;
        //此处一定是点方法, 否则不会调用timer的初始化
        self.autoScroll = YES;
    }
    return self;
}

- (UIPageControl *)pageC {
    if(_page == nil) {
        _page = [[UIPageControl alloc] init];
        [self.maskView addSubview:_page];
        [_page mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-8);
            make.centerY.equalTo(0);
        }];
    }
    return _page;
}

- (UIView *)maskView {
    if(_maskView == nil) {
        _maskView = [[UIView alloc] init];
        //把一些常用的比较复杂的方法, 可以定义成全局宏来使用
        //_maskView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
        _maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.ic addSubview:_maskView];
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(30);
            make.left.bottom.right.equalTo(0);
        }];
    }
    return _maskView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.font = [UIFont systemFontOfSize:14];
        [self.maskView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.centerY.equalTo(0);
        }];
    }
    return _titleLb;
}

- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];
        [self addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = .2;
    }
    return _ic;
}


@end

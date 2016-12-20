//
//  YuanViewCell.m
//  GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "YuanViewCell.h"

@implementation YuanViewCell
- (void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    //判断当前是否是自动滚动状态. 只有是, 才滚动
    self.autoScroll = _autoScroll;
}
//
//- (void)setAutoScroll:(BOOL)autoScroll{
//    _autoScroll = autoScroll;
//    //让之前的timer也失效
//    [_timer invalidate]; //失效, 停止
//    _timer = nil;
//    
//    if (autoScroll) {
//        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
//            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
//        } repeats:YES];
//    }
//}


#pragma mark - ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    //下方写法有风险, 一旦_dataSource指向的对象, 没有实现numberOfItems:方法, 就会崩溃
    if ([_dataSource respondsToSelector:@selector(numberOfItemsForYuan:)]) {
        return [_dataSource numberOfItemsForYuan:self];
    }
    return 0;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, carousel.bounds.size.height)];
        UIImageView *iv = [UIImageView new];
        [view addSubview:iv];
        iv.tag = 100;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(-10); //向上移动10
            make.centerX.equalTo(0);
            make.width.height.equalTo(50);
        }];
        iv.layer.cornerRadius = 25;
        iv.layer.masksToBounds = YES;
        
        UILabel *label = [UILabel new];
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(iv.mas_bottom).equalTo(5);
        }];
        label.tag = 200;

    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    UILabel *label = (UILabel *)[view viewWithTag:200];
    iv.image = [UIImage imageNamed:@"00.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.50233.000.00.@1x"];
    label.text = nil;
    if ([_dataSource respondsToSelector:@selector(yuanHM:titleForIndex:)]) {
        label.text = [_dataSource yuanHM:self titleForIndex:index];
    }
    if ([_dataSource respondsToSelector:@selector(yuanHM:iconURLForIndex:)]) {
        [iv setImageWithURL:[_dataSource yuanHM:self iconURLForIndex:index] placeholder:[UIImage imageNamed:@"10.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.8291.000.00.@1x"]];
    }
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    //必须判断, 如果代理方实现了某个方法才调用
    if ([_delegate respondsToSelector:@selector(yuanHM:didSelectedItemAtIndex:)]) {
        [_delegate yuanHM:self didSelectedItemAtIndex:index];
    }
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}


- (void)reloadData{
    [self.ic reloadData];

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
        
        
        [self ic];
       
        //先后顺序必须是先设置时间, 再设置自动滚动
        _duration = 2.0;
        //此处一定是点方法, 否则不会调用timer的初始化
        self.autoScroll = YES;
    }
    return self;
}


- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];
        [self.contentView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = .5;
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor grayColor];
        [_ic addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(1);
            make.width.equalTo(_ic.mas_width);
            make.bottom.equalTo(_ic.mas_bottom);
        }];
    }
    return _ic;
}

@end

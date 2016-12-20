//
//  UIScrollView+Rerfresh.h
//  GameLive
//
//  Created by tarena on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Rerfresh)
- (void)addHeaderRefresh:(void(^)())block;
- (void)addFooterRefresh:(void(^)())block;

- (void)beginHeaderRefresh;
- (void)beginFooterRefresh;

- (void)endHeaderRefresh;
- (void)endFooterRefresh;

- (void)addGiftHeaderRefresh:(void(^)())block;

@end

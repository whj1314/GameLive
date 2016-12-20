//
//  UIScrollView+Rerfresh.m
//  GameLive
//
//  Created by tarena on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIScrollView+Rerfresh.h"
#import "RefreshGiftHeader.h"
@implementation UIScrollView (Rerfresh)
- (void)addHeaderRefresh:(void(^)())block{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}
- (void)addFooterRefresh:(void(^)())block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}
- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}
- (void)beginFooterRefresh{
    [self.mj_footer beginRefreshing];
}
- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}

- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}

- (void)addGiftHeaderRefresh:(void(^)())block{
    self.mj_header = [RefreshGiftHeader headerWithRefreshingBlock:block];
}

@end

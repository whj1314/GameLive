//
//  RefreshGiftHeader.m
//  GameLive
//
//  Created by 王红军 on 2016/12/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RefreshGiftHeader.h"

@implementation RefreshGiftHeader

- (instancetype)init
{
    if (self = [super init]) {
        self.lastUpdatedTimeLabel.hidden = YES;
        self.stateLabel.hidden = YES;
        [self setImages:@[[UIImage imageNamed:@"00.png"], [UIImage imageNamed:@"01.png"], [UIImage imageNamed:@"02.png"], [UIImage imageNamed:@"03.png"], [UIImage imageNamed:@"04.png"], [UIImage imageNamed:@"05.png"], [UIImage imageNamed:@"06.png"], [UIImage imageNamed:@"07.png"], [UIImage imageNamed:@"08.png"], [UIImage imageNamed:@"09.png"], [UIImage imageNamed:@"10.png"], [UIImage imageNamed:@"11.png"]]  forState:MJRefreshStateRefreshing];
        [self setImages:@[[UIImage imageNamed:@"00.png"], [UIImage imageNamed:@"01.png"], [UIImage imageNamed:@"02.png"], [UIImage imageNamed:@"03.png"], [UIImage imageNamed:@"04.png"], [UIImage imageNamed:@"05.png"], [UIImage imageNamed:@"06.png"], [UIImage imageNamed:@"07.png"], [UIImage imageNamed:@"08.png"], [UIImage imageNamed:@"09.png"], [UIImage imageNamed:@"10.png"], [UIImage imageNamed:@"11.png"]]  forState:MJRefreshStatePulling];
        [self setImages:@[[UIImage imageNamed:@"00.png"], [UIImage imageNamed:@"01.png"], [UIImage imageNamed:@"02.png"], [UIImage imageNamed:@"03.png"], [UIImage imageNamed:@"04.png"], [UIImage imageNamed:@"05.png"], [UIImage imageNamed:@"06.png"], [UIImage imageNamed:@"07.png"], [UIImage imageNamed:@"08.png"], [UIImage imageNamed:@"09.png"], [UIImage imageNamed:@"10.png"], [UIImage imageNamed:@"11.png"]]  forState:MJRefreshStateIdle];
    }
    return self;
}

@end

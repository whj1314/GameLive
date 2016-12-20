//
//  HomeDetailedModel.m
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HomeDetailedModel.h"

@implementation HomeDetailedModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"rank_total":[Rank_Total class],@"rank_week":[Rank_Total class],@"room_lines":[Room_Lines class]};
}
@end

@implementation Live

@end

@implementation Rank_Total

@end

@implementation Room_Lines

@end

@implementation Flv
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"two":@"2",@"three":@"3",@"four":@"4",@"five":@"5"};
}

@end
@implementation Two

@end
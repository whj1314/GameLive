//
//  RocmModel.m
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RocmModel.h"

@implementation RocmModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"moblie_webgame":@"moblie-webgame",
             @"moblie_minecraft":@"moblie-minecraft",
             @"mobile_tvgame":@"mobile-tvgame",
             @"moblie_sport":@"moblie-sport",
             @"mobile_star":@"mobile-star",
             @"mobile_recommendation":@"mobile-recommendation",
             @"mobile_index":@"mobile-index",
             @"mobile_lol":@"mobile-lol",
             @"mobile_beauty":@"mobile-beauty",
             @"mobile_heartstone":@"mobile-heartstone",
             @"moblie_blizzard":@"moblie-blizzard",
             @"mobile_dota2":@"mobile-dota2",
             @"moblie_dnf":@"moblie-dnf"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"moblie_webgame":[MobileRecomModel class],
             @"moblie_minecraft":[MobileRecomModel class],
             @"mobile_tvgame":[MobileRecomModel class],
             @"moblie_sport":[MobileRecomModel class],
             @"mobile_star":[MobileRecomModel class],
             @"mobile_recommendation":[MobileRecomModel class],
             @"mobile_index":[MobileRecomModel class],
             @"mobile_lol":[MobileRecomModel class],
             @"mobile_beauty":[MobileRecomModel class],
             @"mobile_heartstone":[MobileRecomModel class],
             @"moblie_blizzard":[MobileRecomModel class],
             @"list":[RocmListModel class],
             @"mobile_dota2":[MobileRecomModel class],
             @"moblie_dnf":[MobileRecomModel class]};
}
@end

@implementation MobileRecomModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"idt":@"id"};
}
@end

@implementation RocmLinkModel

@end

@implementation RocmListModel

@end
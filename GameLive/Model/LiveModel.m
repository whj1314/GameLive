//
//  LiveModel.m
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[LiveListModel class]};
}
@end
@implementation Recommend
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[RecommendList class]};
}
@end


@implementation RecommendList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"RecommendList":@"Data",@"idre":@"id"};
}
@end


@implementation Link_Object

@end


@implementation LiveListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"LiveListModel":@"Data"};
}
@end



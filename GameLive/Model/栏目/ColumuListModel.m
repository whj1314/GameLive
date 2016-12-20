//
//  ColumuListModel.m
//  GameLive
//
//  Created by tarena on 16/7/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumuListModel.h"

@implementation ColumuListModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[ColumuAllListModel class]};
}
@end
@implementation ColumuAllListModel

@end



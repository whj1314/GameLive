//
//  ColumnModel.m
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumnModel.h"

//@implementation ColumnModel
//+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
//    return @{@"esArray":[ColumnListModel class]};
//}
//@end
@implementation ColumnListModel
kCodingmy
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"idco":@"id"};
}
@end



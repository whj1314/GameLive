//
//  NSObject+parse.m
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSObject+parse.h"

@implementation NSObject (parse)
+ (id)parse:(id)JSON{
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:JSON];
    }
    if ([JSON isKindOfClass:[NSDictionary class]] | [JSON isKindOfClass:[NSString class]] | [JSON isKindOfClass:[NSData class]]) {
        return [self modelWithJSON:JSON];
    }
    return JSON;
}
@end

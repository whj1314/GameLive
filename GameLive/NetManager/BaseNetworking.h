//
//  BaseNetworking.h
//  英雄解析
//
//  Created by tarena on 16/7/25.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetworking : NSObject
+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id repsonseObj ,NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id repsonseObj ,NSError *error))completionHandler;
@end

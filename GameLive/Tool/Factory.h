//
//  Factory.h
//  GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
//自动为传入的参数拼装上返回按钮
+ (void)addBackItemForVC:(UIViewController *)vc;

+ (void)addSearchItemForVC:(UIViewController *)vc clickedHandler:(void(^)())handler;

+ (void)addJumpForVC:(UIViewController *)vc andBtn:(NSString *)btnName clickedHandler:(void(^)())handler;
@end

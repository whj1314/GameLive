//
//  NSObject+parse.h
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (parse)<YYModel,NSCoding>
+ (id)parse:(id)JSON;
@end

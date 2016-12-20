//
//  BaseViewModel.h
//  GameLive
//
//  Created by tarena on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
};
@interface BaseViewModel : NSObject
@property (nonatomic) NSURLSessionDataTask *dataTask;
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;
@end

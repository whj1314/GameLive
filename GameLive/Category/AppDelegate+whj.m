//
//  AppDelegate+whj.m
//  GameLive
//
//  Created by tarena on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate+whj.h"

@implementation AppDelegate (whj)
- (void)configApplication:(NSDictionary *)options{
    
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

@end

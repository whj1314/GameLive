//
//  NetManager.m
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (id)getTuijiancompletionHandler:(void (^)(RocmModel *, NSError *))completionHandler{
    return [self GET:kTuijian parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler?:completionHandler([RocmModel parse:repsonseObj],error);
    }];
}
+ (id)getLiveNumber:(NSString *)Number Andline:(NSString *)line completionHandler:(void (^)(LiveModel *, NSError *))completionHandler{
    NSString *liveURL = [NSString stringWithFormat:kLive,line,Number];
    return [self GET:liveURL parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([LiveModel parse:repsonseObj],error);
    }];
}
+ (id)columnModel:(void (^)(NSArray<ColumnListModel*> *model, NSError *))completionHandler{
    return [self GET:kColumu parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([ColumnListModel parse:repsonseObj],error);
    }];
}
+ (id)getHomeDetailedUID:(NSString *)uid completionHandler:(void (^)(HomeDetailedModel *, NSError *))completionHandler{
    NSString *homeURL = [NSString stringWithFormat:kHomeDate,uid];
    return [self GET:homeURL parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([HomeDetailedModel parse:repsonseObj],error);
    }];
}
+ (id)getColumuNum:(NSString *)num AndLine:(NSString *)line AndSlug:(NSString *)slug completionHandler:(void (^)(ColumuListModel *, NSError *))completionHandler{
    NSString *list = [NSString stringWithFormat:kColumuList,slug,line,num];
    NSLog(@"网址：-*----->.%@",list);
    return [self GET:list parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([ColumuListModel parse:repsonseObj],error);
    }];
}
@end

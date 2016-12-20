//
//  NetManager.h
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetworking.h"
#import "LiveModel.h"
#import "ColumnModel.h"
#import "HomeDetailedModel.h"
#import "ColumuListModel.h"
#import "RocmModel.h"
@interface NetManager : BaseNetworking
//推荐
+ (id)getTuijiancompletionHandler:(void(^)(RocmModel *model,NSError *error))completionHandler;
//直播
+ (id)getLiveNumber:(NSString *)Number Andline:(NSString *)line completionHandler:(void(^)(LiveModel *model ,NSError *error))completionHandler;
+ (id)getHomeDetailedUID:(NSString *)uid completionHandler:(void(^)(HomeDetailedModel *model ,NSError *error))completionHandler;
//栏目
+ (id)columnModel:(void(^)(NSArray<ColumnListModel*> *model,NSError *error))completionHandler;
+ (id)getColumuNum:(NSString *)num AndLine:(NSString *)line AndSlug:(NSString *)slug completionHandler:(void(^)(ColumuListModel *model,NSError *error))completionHandler;
@end

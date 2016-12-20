//
//  LiveModel.h
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Recommend,RecommendList,Link_Object,LiveListModel;
@interface LiveModel : NSObject

@property (nonatomic, strong) Recommend *recommend;

@property (nonatomic, strong) NSArray<LiveListModel *> *data;

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, copy) NSString *icon;

@end
@interface Recommend : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong) NSArray<RecommendList *> *data;

@end
//RecommendList -> Data
@interface RecommendList : NSObject
//idre -> id
@property (nonatomic, assign) NSInteger idre;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger slot_id;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, strong) Link_Object *link_object;

@property (nonatomic, copy) NSString *ext;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *fk;

@end

@interface Link_Object : NSObject

@property (nonatomic, copy) NSString *default_image;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *category_slug;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *app_shuffling_image;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *follow;

@end
//LiveListModel -> Data
@interface LiveListModel : NSObject

@property (nonatomic, copy) NSString *default_image;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *category_slug;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *app_shuffling_image;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, assign) NSInteger follow;

@end


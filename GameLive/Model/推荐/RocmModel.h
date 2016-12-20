//
//  RocmModel.h
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RocmLinkModel,RocmListModel,MobileRecomModel;
@interface RocmModel : NSObject

@property (nonatomic, strong) NSArray<MobileRecomModel *> *moblie_webgame;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *moblie_minecraft;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *mobile_tvgame;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *moblie_sport;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *mobile_star;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *mobile_recommendation;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *mobile_index;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *mobile_lol;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *mobile_beauty;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *mobile_heartstone;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *moblie_blizzard;

@property (nonatomic, strong) NSArray<RocmListModel *> *list;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *mobile_dota2;

@property (nonatomic, strong) NSArray<MobileRecomModel *> *moblie_dnf;

@end

@interface MobileRecomModel: NSObject
//idt->id
@property (nonatomic, assign) NSInteger idt;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger slot_id;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, strong) RocmLinkModel *link_object;

@property (nonatomic, copy) NSString *ext;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *fk;

@end

@interface RocmLinkModel : NSObject

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

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *follow;

@end

@interface RocmListModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *category_slug;

@end
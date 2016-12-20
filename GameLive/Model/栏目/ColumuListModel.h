//
//  ColumuListModel.h
//  GameLive
//
//  Created by tarena on 16/7/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ColumuAllListModel;
@interface ColumuListModel : NSObject

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSArray<ColumuAllListModel *> *data;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger pageCount;

@end
@interface ColumuAllListModel : NSObject

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

@property (nonatomic, assign) NSInteger follow;

@end


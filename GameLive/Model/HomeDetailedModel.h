//
//  HomeDetailedModel.h
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Live,Room_Lines,Rank_Total,Two,Flv;
@interface HomeDetailedModel : NSObject

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, assign) NSInteger weight;

@property (nonatomic, copy) NSString *last_play_at;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL play_status;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, strong) Live *live;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, assign) BOOL forbid_status;

@property (nonatomic, strong) NSArray *hot_word;

@property (nonatomic, strong) NSArray *admins;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, strong) NSArray<Rank_Total *> *rank_total;

@property (nonatomic, strong) NSArray<Room_Lines *> *room_lines;

@property (nonatomic, strong) NSArray<Rank_Total *> *rank_week;

@property (nonatomic, assign) BOOL is_star;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, strong) NSArray *notice;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger view;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, assign) BOOL warn;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, assign) NSInteger follow;

@end
@interface Live : NSObject

@property (nonatomic, strong) Room_Lines *ws;

@end



@interface Rank_Total : NSObject

@property (nonatomic, copy) NSString *icon_url;

@property (nonatomic, assign) NSInteger score;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *rank;

@property (nonatomic, assign) NSInteger send_uid;

@property (nonatomic, copy) NSString *send_nick;

@end

@interface Room_Lines : NSObject

@property (nonatomic, copy) NSString *def_pc;

@property (nonatomic, strong) Flv *flv;

@property (nonatomic, strong) Flv *hls;

@property (nonatomic, assign) NSInteger v;

@property (nonatomic, strong) Flv *rtmp;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *def_mobile;

@end

@interface Flv : NSObject
//two -> 2
@property (nonatomic) Two* two;
//three -> 3
@property (nonatomic) Two* three;
//four -> 4
@property (nonatomic) Two* four;
//five -> 5
@property (nonatomic) Two* five;

@property (nonatomic) NSInteger main_mobile;

@property (nonatomic) NSInteger main_pc;

@end

@interface Two : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *src;

@end




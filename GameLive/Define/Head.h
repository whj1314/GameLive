//
//  Head.h
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#ifndef Head_h
#define Head_h
/*Model层链接*/
#define kDomain @"http://www.quanmin.tv"

//推荐
#define kTuijian @"/json/page/app-index/info.json"
//直播
#define kLive @"/json/play/list%@%@.json"
//栏目
#define kColumu @"/json/categories/list.json"
#define kColumuList @"/json/categories/%@/list%@%@.json"
//我的
#define kHomeDate @"/json/rooms/%@/info.json"



#define kLives @"http://hls.quanmin.tv/live/%@/playlist.m3u8"





#define kCodingmy \
- (void)encodeWithCoder:(NSCoder *)aCoder {\
[self modelEncodeWithCoder:aCoder];\
}\
- (id)initWithCoder:(NSCoder *)aDecoder {\
self = [super init]; return [self modelInitWithCoder:aDecoder];\
}\
- (NSString *)description {\
return [self modelDescription];\
}\





#endif /* Head_h */

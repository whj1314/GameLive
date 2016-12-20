//
//  LiveViewModel.m
//  GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveViewModel.h"

@implementation LiveViewModel
- (NSMutableArray<LiveListModel *> *)allLive {
    if(_allLive == nil) {
        _allLive = [[NSMutableArray<LiveListModel *> alloc] init];
    }
    return _allLive;
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSString *num = @"";
    NSString *line = @"";
    if (requestMode == RequestModeMore) {
        line = @"_";
        num = [NSString stringWithFormat:@"%ld",(long)_num+1];
    }
    self.dataTask = [NetManager getLiveNumber:num Andline:line completionHandler:^(LiveModel *model, NSError *error) {
        if (!error) {
            NSLog(@"model:%@",model.data);
            if (requestMode == RequestModeRefresh) {
                [self.allLive removeAllObjects];
            }
            [self.allLive addObjectsFromArray:model.data];
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSInteger)num{
    return _allLive.count;
}
- (NSURL *)icon:(NSInteger)row{
    return self.allLive[row].thumb.whj_URL;
}
- (NSString *)name:(NSInteger)row{
    return self.allLive[row].nick;
}
- (NSString *)readNum:(NSInteger)row{
    NSInteger foll = self.allLive[row].follow;
    NSString *str= nil;
    if (foll >= 10000) {
        return str = [NSString stringWithFormat:@"%.1f万",foll/10000.0];
    }else{
        return str = [NSString stringWithFormat:@"%ld",(long)foll];
    }
}
- (NSString *)title:(NSInteger)row{
    return self.allLive[row].title;
}
- (NSString *)uid:(NSInteger)row{
    NSString *str = [NSString stringWithFormat:kLives,_allLive[row].uid];
    return str;
}

@end

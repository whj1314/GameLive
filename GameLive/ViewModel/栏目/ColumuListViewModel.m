//
//  ColumuListViewModel.m
//  GameLive
//
//  Created by tarena on 16/7/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumuListViewModel.h"

@implementation ColumuListViewModel
- (instancetype)initWithUID:(NSString *)uid{
    if (self = [super init]) {
        _uid = uid;
    }
    return self;
}
- (NSMutableArray<ColumuAllListModel *> *)allCol {
    if(_allCol == nil) {
        _allCol = [[NSMutableArray<ColumuAllListModel *> alloc] init];
    }
    return _allCol;
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSString *num = @"";
    NSString *line = @"";
    if (requestMode == RequestModeMore) {
        line = @"_";
        num = [NSString stringWithFormat:@"%ld",(long)_num+1];
    }
    self.dataTask = [NetManager getColumuNum:num AndLine:line AndSlug:_uid completionHandler:^(ColumuListModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.allCol removeAllObjects];
            }
            [_allCol addObjectsFromArray:model.data];
            NSLog(@"allcol:%@",_allCol);
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSInteger)number{
    NSLog(@"View里边的行数：%lu",(unsigned long)_allCol.count);
    return _allCol.count;
}
- (NSURL *)icon:(NSInteger)row{
    return _allCol[row].thumb.whj_URL;
}
- (NSString *)name:(NSInteger)row{
    return _allCol[row].nick;
}
- (NSString *)peopleNumber:(NSInteger)row{
    NSInteger foll = self.allCol[row].follow;
    NSString *str= nil;
    if (foll >= 10000) {
        return str = [NSString stringWithFormat:@"%.1f万",foll/10000.0];
    }else{
        return str = [NSString stringWithFormat:@"%ld",(long)foll];
    }
}
- (NSString *)title:(NSInteger)row{
    return _allCol[row].title;
}
- (NSString *)uid:(NSInteger)row{
    NSString *str = [NSString stringWithFormat:kLives,_allCol[row].uid];
    return str;
}
@end

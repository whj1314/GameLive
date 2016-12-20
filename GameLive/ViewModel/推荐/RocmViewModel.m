//
//  RocmViewModel.m
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RocmViewModel.h"

@implementation RocmViewModel
- (NSMutableArray<RocmListModel *> *)allList {
    if(_allList == nil) {
        _allList = [[NSMutableArray<RocmListModel *> alloc] init];
    }
    return _allList;
}
- (NSMutableArray<MobileRecomModel *> *)allRecom {
    if(_allRecom == nil) {
        _allRecom = [[NSMutableArray<MobileRecomModel *> alloc] init];
    }
    return _allRecom;
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [NetManager getTuijiancompletionHandler:^(RocmModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                NSLog(@"这是lol数据:%@",model.mobile_lol);
                [self.allRecom removeAllObjects];
                [self.allList removeAllObjects];
            }
            _allIndex = model.mobile_index.copy;
            _allStar = model.mobile_star.copy;
            _dic = [NSMutableDictionary new];
            [self.allList addObjectsFromArray:model.list];
            [_dic setValue:model.moblie_webgame forKey:@"moblie-webgame"];
            [_dic setValue:model.moblie_minecraft forKey:@"moblie-minecraft"];
            [_dic setValue:model.mobile_tvgame forKey:@"mobile-tvgame"];
            [_dic setValue:model.moblie_sport forKey:@"moblie-sport"];
            [_dic setValue:model.mobile_star forKey:@"mobile-star"];
            [_dic setValue:model.mobile_recommendation forKey:@"mobile-recommendation"];
            [_dic setValue:model.mobile_index forKey:@"mobile-index"];
            [_dic setValue:model.mobile_lol forKey:@"mobile-lol"];
            [_dic setValue:model.mobile_beauty forKey:@"mobile-beauty"];
            [_dic setValue:model.mobile_heartstone forKey:@"mobile-heartstone"];
            [_dic setValue:model.moblie_blizzard forKey:@"moblie-blizzard"];
            [_dic setValue:model.mobile_dota2 forKey:@"mobile-dota2"];
            [_dic setValue:model.moblie_dnf forKey:@"moblie-dnf"];
            NSLog(@"allKeysa a a ---->  %@",_dic.allKeys);
        }
        !completionHandler?:completionHandler(error);
    }];
}
//coll
- (NSInteger)setion{
    return _allList.count - 2;
}
-(NSInteger)num:(NSInteger)secon{
    _allRecom = [_dic objectForKey:_allList[secon + 2].slug];
    return _allRecom.count;
}
- (NSString *)iconForSecton:(NSInteger)section item:(NSInteger)item{
    _allRecom = [_dic objectForKey:_allList[section + 2].slug];
    NSString *str = _allRecom[item].link_object.thumb;
    return str;
}
- (NSString *)nameForSecton:(NSInteger)section item:(NSInteger)item{
    _allRecom = [_dic objectForKey:_allList[section + 2].slug];
    NSString *str = _allRecom[item].link_object.nick;
    return str;
}
- (NSString *)titleForSecton:(NSInteger)section item:(NSInteger)item{
    _allRecom = [_dic objectForKey:_allList[section + 2].slug];
    NSString *str = _allRecom[item].link_object.title;
    return str;
}
- (NSString *)readForSecton:(NSInteger)section item:(NSInteger)item{
    _allRecom = [_dic objectForKey:_allList[section + 2].slug];
//    NSString *str = _allRecom[item].link_object.follow;
    NSInteger foll = _allRecom[item].link_object.follow.intValue;
    NSString *str= nil;
    if (foll >= 10000) {
        return str = [NSString stringWithFormat:@"%.1f万",foll/10000.0];
    }else{
        return str = [NSString stringWithFormat:@"%ld",(long)foll];
    }
    return str;
}
- (NSString *)sulg:(NSInteger)section{
    return _allList[section + 2].name;
}
- (NSString *)uidWithSection:(NSInteger)section item:(NSInteger)item{
    _allRecom = [_dic objectForKey:_allList[section + 2].slug];
    NSString *str = [NSString stringWithFormat:kLives,_allRecom[item].link_object.uid];
    return str;
}
- (NSMutableArray<MobileRecomModel *> *)allIndex {
    if(_allIndex == nil) {
        _allIndex = [[NSMutableArray<MobileRecomModel *> alloc] init];
    }
    return _allIndex;
}

- (NSInteger)indexNum{
    return _allIndex.count;
}
- (NSString *)title:(NSInteger)row{
    return _allIndex[row].link_object.title;
}
- (NSURL *)URL:(NSInteger)row{
    return _allIndex[row].link_object.thumb.whj_URL;
}
- (NSURL *)vodeo:(NSInteger)row{
    NSString *str = [NSString stringWithFormat:kLives,_allIndex[row].link_object.uid];
    return str.whj_URL;
}

- (NSMutableArray<MobileRecomModel *> *)allStar {
    if(_allStar == nil) {
        _allStar = [[NSMutableArray<MobileRecomModel *> alloc] init];
    }
    return _allStar;
}
-(NSInteger)pointNum{
    return _allStar.count;
}
- (NSString *)pointTitle:(NSInteger)row{
    return _allStar[row].title;
}
- (NSURL *)pointURL:(NSInteger)row{
    return _allStar[row].thumb.whj_URL;
}
- (NSURL *)pointVideo:(NSInteger)row{
    NSString *str = [NSString stringWithFormat:kLives,_allStar[row].fk];
    return str.whj_URL;
}

@end

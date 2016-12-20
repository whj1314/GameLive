//
//  RocmViewModel.h
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NetManager.h"
#import "RocmModel.h"
@interface RocmViewModel : BaseViewModel
@property (nonatomic) NSMutableArray<RocmListModel *> *allList;
@property (nonatomic) NSMutableArray<MobileRecomModel *> *allRecom;
@property (nonatomic) NSInteger setion;
- (NSInteger)num:(NSInteger)secon;
- (NSString *)iconForSecton:(NSInteger)section item:(NSInteger)item;
- (NSString *)nameForSecton:(NSInteger)section item:(NSInteger)item;
- (NSString *)readForSecton:(NSInteger)section item:(NSInteger)item;
- (NSString *)titleForSecton:(NSInteger)section item:(NSInteger)item;
- (NSString *)sulg:(NSInteger)section;
- (NSString *)uidWithSection:(NSInteger)section item:(NSInteger)item;
@property (nonatomic) NSMutableDictionary *dic;


//滚动
@property (nonatomic) NSMutableArray<MobileRecomModel *> *allIndex;
@property (nonatomic)NSInteger indexNum;
- (NSString *)title:(NSInteger)row;
- (NSURL *)URL:(NSInteger)row;
- (NSURL *)vodeo:(NSInteger)row;


//圆
@property (nonatomic) NSMutableArray<MobileRecomModel *> *allStar;
@property (nonatomic)NSInteger pointNum;
- (NSString *)pointTitle:(NSInteger)row;
- (NSURL *)pointURL:(NSInteger)row;
- (NSURL *)pointVideo:(NSInteger)row;
@end

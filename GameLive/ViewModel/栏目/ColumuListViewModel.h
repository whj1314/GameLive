//
//  ColumuListViewModel.h
//  GameLive
//
//  Created by tarena on 16/7/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NetManager.h"
#import "ColumuListModel.h"

@interface ColumuListViewModel : BaseViewModel
- (instancetype)initWithUID:(NSString *)uid;
@property (nonatomic) NSString *uid;

@property (nonatomic) NSMutableArray<ColumuAllListModel *> *allCol;
@property (nonatomic) NSInteger number;
@property (nonatomic) NSInteger num;
- (NSURL *)icon:(NSInteger)row;
- (NSString *)name:(NSInteger)row;
- (NSString *)peopleNumber:(NSInteger)row;
- (NSString *)title:(NSInteger)row;
- (NSString *)uid:(NSInteger)row;
@end

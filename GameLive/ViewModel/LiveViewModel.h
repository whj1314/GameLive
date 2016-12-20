//
//  LiveViewModel.h
//  GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LiveModel.h"
#import "NetManager.h"
@interface LiveViewModel : BaseViewModel
@property (nonatomic) NSMutableArray<LiveListModel *> *allLive;
@property (nonatomic) NSInteger *rowNumber;
@property (nonatomic) NSInteger num;
- (NSURL *)icon:(NSInteger)row;
- (NSString *)name:(NSInteger)row;
- (NSString *)readNum:(NSInteger)row;
- (NSString *)title:(NSInteger)row;
- (NSString *)uid:(NSInteger)row;




@end

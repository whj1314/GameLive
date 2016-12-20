//
//  ColumuViewModel.h
//  GameLive
//
//  Created by tarena on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ColumnModel.h"
@interface ColumuViewModel : BaseViewModel
@property (nonatomic) NSMutableArray<ColumnListModel *> *allColumu;
@property (nonatomic)NSInteger rowNumber;


- (NSURL *)icon:(NSInteger)row;
- (NSString *)title:(NSInteger)row;
- (NSString *)slugKey:(NSInteger)row;
@end

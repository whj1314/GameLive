//
//  ColumnModel.h
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class ColumnListModel;
//@interface ColumnModel : NSObject
//
//@property (nonatomic, strong) NSArray<ColumnListModel *> *esArray;
//
//@end
//ColumnListModel -> Esarray
@interface ColumnListModel : NSObject

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *first_letter;

@property (nonatomic, assign) NSInteger status;
//idco -> id
@property (nonatomic, assign) NSInteger idco;

@property (nonatomic, assign) NSInteger prompt;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *name;

@end


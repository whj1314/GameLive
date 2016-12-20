//
//  ColumuViewModel.m
//  GameLive
//
//  Created by tarena on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumuViewModel.h"
#import "NetManager.h"
@interface ColumuViewModel()
@property (nonatomic) NSString *cachePath;
@end

@implementation ColumuViewModel
- (NSString *)cachePath {
    if(_cachePath == nil) {
        NSString *docPsth = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        _cachePath = [docPsth stringByAppendingPathComponent:@"ColumuViewModel"];
    }
    return _cachePath;
}
//- (instancetype)init{
//    self = [super init];
//    if (self) {
//        id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:self.cachePath];
//    }
//    if (obj) {
//        self = obj;
//    }
//    return self;
//}
kCodingmy
- (NSMutableArray<ColumnListModel *> *)allColumu {
    if(_allColumu == nil) {
        _allColumu = [[NSMutableArray<ColumnListModel *> alloc] init];
    }
    return _allColumu;
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [NetManager columnModel:^(NSArray<ColumnListModel*> *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.allColumu removeAllObjects];
            }
            [NSKeyedArchiver archiveRootObject:self toFile:self.cachePath];
            NSLog(@"model:%@",model);
            [self.allColumu addObjectsFromArray:model];
            NSLog(@"allcoumu:%@",self.allColumu);
        }
        
        !completionHandler ?: completionHandler(error);
        NSLog(@"error:%@",error);
    }];
}

-(NSInteger)rowNumber{
    return _allColumu.count;
}
- (NSURL *)icon:(NSInteger)row{
    return _allColumu[row].image.whj_URL;
}
- (NSString *)title:(NSInteger)row{
    return _allColumu[row].name;
}
- (NSString *)slugKey:(NSInteger)row{
    return _allColumu[row].slug;
}


@end

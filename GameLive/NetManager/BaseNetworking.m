//
//  BaseNetworking.m
//  英雄解析
//
//  Created by tarena on 16/7/25.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetworking.h"

@implementation BaseNetworking
+(id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:kDomain.whj_URL];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    NSString* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"dicPath文件夹路径:%@",docPath);
    
    return [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        
        //判断文件夹是否存在
        NSString *filepath=[docPath stringByAppendingPathComponent:@"Empy"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //如果不存在
        if (![fileManager fileExistsAtPath:filepath]) {
            
            /**缓存**/
            NSString* dir0 = [docPath stringByAppendingPathComponent:@"Empy"];
            //创建文件夹
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:dir0 withIntermediateDirectories:YES attributes:nil error:&error];
            if (error) {
                NSLog(@"创建错误呀");
            }else{
                NSLog(@"创建成功");
            }
        }
        [[NSOperationQueue new] addOperationWithBlock:^{
            //拼接文件夹路径
            NSString *fileName = [NSString stringWithFormat:@"Empy/%@",task.currentRequest.URL.absoluteString.md5String];
            NSString *cachePath = [docPath stringByAppendingPathComponent:fileName];
            NSLog(@"文件夹路径:%@",cachePath);
            [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
        }];
        !completionHandler ?: completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        NSLog(@"%@",error);
        
        /***读缓存**/
        NSString *fileName = [NSString stringWithFormat:@"Empy/%@",task.currentRequest.URL.absoluteString.md5String];
        NSString *cachePath = [docPath stringByAppendingPathComponent:fileName];
        NSLog(@"文件夹路径:%@",cachePath);
        id responseObject = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
        if (responseObject) {
            
            !completionHandler?:completionHandler(responseObject,nil);
        }else{
            !completionHandler?:completionHandler(nil,error);
        }
    }];
}
+(id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:kDomain.whj_URL];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    return [manager POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        !completionHandler ?: completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        NSLog(@"%@",error);
        !completionHandler?:completionHandler(nil,error);
    }];
}

@end

//
//  EmptyViewController.m
//  GameLive
//
//  Created by tarena on 16/8/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "EmptyViewController.h"

@interface EmptyViewController ()

@end

@implementation EmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Factory addBackItemForVC:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.title = @"优化大师";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"清空数据缓存";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"清空图片缓存";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NSError *error = nil;
        NSString* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *cachePath = [docPath stringByAppendingPathComponent:@"Empy"];
        [[NSFileManager defaultManager] removeItemAtPath:cachePath error:&error];
        if (error) {
            NSLog(@"删除错误呀");
        }else{
            NSLog(@"删除成功");
        }
    }
    if (indexPath.row == 1) {
        NSError *error = nil;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesDir = [paths objectAtIndex:0];
        NSString *cachePath = [cachesDir stringByAppendingPathComponent:@"com.ibireme.yykit/images/data"];
        [[NSFileManager defaultManager] removeItemAtPath:cachePath error:&error];
        if (error) {
            NSLog(@"删除错误呀");
        }else{
            NSLog(@"删除成功");
        }
    }
}


@end

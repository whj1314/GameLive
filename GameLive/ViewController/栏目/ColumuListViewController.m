//
//  ColumuListViewController.m
//  GameLive
//
//  Created by tarena on 16/7/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumuListViewController.h"
#import "ColumuListViewModel.h"
#import "LiveViewCell.h"
@import AVKit;
@import AVFoundation;
@interface ColumuListViewController ()
@property (nonatomic)ColumuListViewModel *allcoll;
@end

@implementation ColumuListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemForVC:self];
        [self.collectionView registerClass:[LiveViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) weakSelf = self;
   [self.collectionView addHeaderRefresh:^{
       [weakSelf.allcoll getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
           [weakSelf.collectionView reloadData];
           [weakSelf.collectionView endHeaderRefresh];
       }];
   }];
    [weakSelf.collectionView beginHeaderRefresh];
    [weakSelf.collectionView addFooterRefresh:^{
        [weakSelf.allcoll getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endFooterRefresh];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"栏目游戏行数:%ld",(long)_allcoll.number);
    return _allcoll.number;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconImage setImageURL:[_allcoll icon:indexPath.item]];
    cell.playerName.text = [_allcoll name:indexPath.item];
    NSLog(@"name:%@",[_allcoll name:indexPath.item]);
    cell.readNum.text = [_allcoll peopleNumber:indexPath.item];
    cell.title.text = [_allcoll title:indexPath.item];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShowTimeViewController *showtime = [[ShowTimeViewController alloc]initWithURL:[_allcoll uid:indexPath.item].whj_URL];
    [self.navigationController pushViewController:showtime animated:YES];

}
#pragma mark <UICollectionViewDelegate>


- (ColumuListViewModel *)allcoll {
	if(_allcoll == nil) {
		_allcoll = [[ColumuListViewModel alloc] initWithUID:self.slug];
	}
	return _allcoll;
}

@end

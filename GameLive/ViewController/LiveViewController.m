//
//  LiveViewController.m
//  GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveViewModel.h"
#import "LiveViewCell.h"
#import "MySeachViewController.h"
@import AVKit;
@import AVFoundation;
@interface LiveViewController ()
@property (nonatomic) LiveViewModel *allLive;
@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [Factory addSearchItemForVC:self clickedHandler:^{
        UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (long)((self.view.frame.size.width) - 3*10)/2;
        CGFloat height = width - 60 ;
        layout.itemSize = CGSizeMake(width, height);
        MySeachViewController *seach = [[MySeachViewController alloc]initWithCollectionViewLayout:layout];
        [self.navigationController pushViewController:seach animated:NO];

    }];
    
    [self.collectionView registerClass:[LiveViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) weakSelf = self;
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.allLive getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [weakSelf.collectionView beginHeaderRefresh];
    [weakSelf.collectionView addFooterRefresh:^{
        [weakSelf.allLive getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endFooterRefresh];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"行数%ld",(long)_allLive.num);
    return _allLive.num;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.iconImage setImageWithURL:[_allLive icon:indexPath.item] placeholder:[UIImage imageNamed:@"主播正在赶来.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.5458.000.00.@1x"]];
    cell.playerName.text = [_allLive name:indexPath.item];
    cell.readNum.text = [_allLive readNum:indexPath.item];
    cell.title.text = [_allLive title:indexPath.item];
    
    cell.contentView.layer.borderWidth = 0.5f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    return cell;
}
#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShowTimeViewController *showtime = [[ShowTimeViewController alloc]initWithURL:[_allLive uid:indexPath.item].whj_URL];
    [self.navigationController pushViewController:showtime animated:YES];
}
- (LiveViewModel *)allLive {
    if(_allLive == nil) {
        _allLive = [[LiveViewModel alloc] init];
    }
    return _allLive;
}



@end

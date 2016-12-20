//
//  RecomViewController.m
//  GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RecomViewController.h"
#import "NetManager.h"
#import "LiveViewCell.h"
#import "RocmViewModel.h"
#import "HeaderReusableView.h"
#import "RocmHeaderModel.h"
#import "YuanViewCell.h"

@import AVKit;
@import AVFoundation;
@interface RecomViewController ()<UICollectionViewDelegateFlowLayout,HeaderViewDataSource,HeaderViewDelegate,YuanViewDelegate,YuanViewDataSource>
@property (nonatomic)RocmViewModel *allRocModel;
@property (nonatomic)RocmHeaderModel *allIc;
@property (nonatomic)YuanViewCell *allYuan;
@end
@implementation RecomViewController

- (RocmHeaderModel *)allIc {
    if(_allIc == nil) {
        _allIc = [[RocmHeaderModel alloc] init];
        _allIc.delegate = self;
        _allIc.dataSource = self;
        _allIc.duration = 3;
    }
    return _allIc;
}
- (NSInteger)numberOfItems:(RocmHeaderModel *)rocm{
    return _allRocModel.indexNum;
}
- (NSURL *)rocmHM:(RocmHeaderModel *)rocm iconURLForIndex:(NSInteger)index{
    return [_allRocModel URL:index];
}
- (NSString *)rocmHM:(RocmHeaderModel *)rocm titleForIndex:(NSInteger)index{
    return [_allRocModel title:index];
}
- (void)rocmHM:(RocmHeaderModel *)rocm didSelectedItemAtIndex:(NSInteger)index{
    ShowTimeViewController *showtime = [[ShowTimeViewController alloc]initWithURL:[_allRocModel vodeo:index]];
    [self.navigationController pushViewController:showtime animated:YES];

}

- (NSInteger)numberOfItemsForYuan:(YuanViewCell *)yuan{
    return _allRocModel.pointNum;
}
- (NSURL *)yuanHM:(YuanViewCell *)rocm iconURLForIndex:(NSInteger)index{
    return [_allRocModel pointURL:index];
}
-(NSString *)yuanHM:(YuanViewCell *)rocm titleForIndex:(NSInteger)index{
    return [_allRocModel pointTitle:index];
}
- (void)yuanHM:(YuanViewCell *)rocm didSelectedItemAtIndex:(NSInteger)index{
    ShowTimeViewController *showtime = [[ShowTimeViewController alloc]initWithURL:[_allRocModel pointVideo:index]];
    [self.navigationController pushViewController:showtime animated:YES];

}
//协议: 定义不同分组中的cell的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}

//协议: 自定义某个section中的某个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (indexPath.section == 0) { //不同分区 不同cell 大小不同
        if (indexPath.row == 0) {
            return CGSizeMake(width, width * 400 / 720);
        }else{
            return CGSizeMake(width, 100);
        }
    }else{
        return CGSizeMake((long)((width-30) / 2), 130);
    }
}

//协议:指定某个section的 内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsZero;
    }else{
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
}

//协议:返回组头Section的header的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) { //去掉第0个分区的头部
        return CGSizeZero;
    }
    return CGSizeMake(300, 30);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[RocmHeaderModel class] forCellWithReuseIdentifier:@"hell"];
    [self.collectionView registerClass:[HeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    [self.collectionView registerClass:[LiveViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[YuanViewCell class] forCellWithReuseIdentifier:@"yell"];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"logo.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.64752.000.00.@1x"] style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.leftBarButtonItem = rightBar;
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    [self.collectionView addGiftHeaderRefresh:^{
        [weakSelf.allRocModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [weakSelf.collectionView beginHeaderRefresh];
}
//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        HeaderReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
        header.title.text = [_allRocModel sulg:indexPath.section];
        [header.btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        if (indexPath.section == 1) {
            header.add.image = [UIImage imageNamed:@"换一换.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.37251.000.00.@1x"];
            header.more.text = @"换一换";
        }
        return header;
    }else{
        return nil;
    }
}
- (void)btn:(UIButton *)sender{
    NSLog(@"按钮被点击");
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    ShowTimeViewController *showtime = [[ShowTimeViewController alloc]initWithURL:[_allRocModel uidWithSection:indexPath.section item:indexPath.item].whj_URL];
    [self.navigationController pushViewController:showtime animated:YES];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _allRocModel.setion;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return [_allRocModel num:section];
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            RocmHeaderModel *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hell" forIndexPath:indexPath];
            cell.delegate = self;
            cell.dataSource = self;
            
            [cell reloadData];
            return cell;
        }else{
            YuanViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"yell" forIndexPath:indexPath];
            cell.delegate = self;
            cell.dataSource = self;
            [cell reloadData];
            return cell;
        }
        return nil;
    }
    LiveViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.title.text = [_allRocModel titleForSecton:indexPath.section item:indexPath.item];
    cell.playerName.text = [_allRocModel nameForSecton:indexPath.section item:indexPath.item];
    cell.readNum.text = [_allRocModel readForSecton:indexPath.section item:indexPath.item];
    [cell.iconImage setImageWithURL:[_allRocModel iconForSecton:indexPath.section item:indexPath.item].whj_URL placeholder:[UIImage imageNamed:@"主播正在赶来.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.5458.000.00.@1x"]];
    return cell;
}
- (RocmViewModel *)allRocModel {
    if(_allRocModel == nil) {
        _allRocModel = [[RocmViewModel alloc] init];
    }
    return _allRocModel;
}





- (YuanViewCell *)allYuan {
    if(_allYuan == nil) {
        _allYuan = [[YuanViewCell alloc] init];
    }
    return _allYuan;
}

@end


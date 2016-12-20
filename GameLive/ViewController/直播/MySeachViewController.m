//
//  MySeachViewController.m
//  GameLive
//
//  Created by tarena on 16/8/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MySeachViewController.h"
#import "LiveViewModel.h"
#import "LiveViewCell.h"
@interface MySeachViewController ()<UISearchBarDelegate>
@property (nonatomic)UISearchBar *searchC;
@property (nonatomic) LiveViewModel *allLives;
@property (nonatomic) NSMutableArray<LiveListModel *> *arr;
@property (nonatomic) NSMutableArray<LiveListModel *> *tmpArr;
@end

@implementation MySeachViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.searchC;
    [self.collectionView registerClass:[LiveViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.allLives getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
        self.arr =_allLives.allLive.copy;
    }];
    
}
//监听变化的代理方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [_arr enumerateObjectsUsingBlock:^(LiveListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj.title containsString:searchText] | [obj.nick containsString:searchText]) {
            [self.tmpArr addObject:obj];
            NSLog(@"--------------");
            [self.collectionView reloadData];
        }
        
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"tmparr---->,%lu",(unsigned long)_tmpArr.count);
    return _tmpArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.playerName.text = _tmpArr[indexPath.row].nick;
    cell.title.text  = _tmpArr[indexPath.row].title;
    NSInteger num =_tmpArr[indexPath.row].follow;
    NSString *str = [NSString stringWithFormat:@"%ld",(long)num];
    cell.readNum.text = str;
    [cell.iconImage setImageWithURL:_tmpArr[indexPath.row].thumb.whj_URL placeholder:[UIImage imageNamed:@"主播正在赶来.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.5458.000.00.@1x"]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (UISearchBar *)searchC {
    if(_searchC == nil) {
        _searchC = [[UISearchBar alloc] init];
        //搜索栏发生变化时的代理
        _searchC.delegate = self;
        _searchC.placeholder = @"主播名/英雄名/房间名";
    }
    return _searchC;
}

- (LiveViewModel *)allLives {
    if(_allLives == nil) {
        _allLives = [[LiveViewModel alloc] init];
    }
    return _allLives;
}




- (NSMutableArray<LiveListModel *> *)arr {
    if(_arr == nil) {
        _arr = [[NSMutableArray<LiveListModel *> alloc] init];
    }
    return _arr;
}

- (NSMutableArray<LiveListModel *> *)tmpArr {
    if(_tmpArr == nil) {
        _tmpArr = [[NSMutableArray<LiveListModel *> alloc] init];
    }
    return _tmpArr;
}

@end

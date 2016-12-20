//
//  ColumuViewController.m
//  GameLive
//
//  Created by tarena on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumuViewController.h"
#import "ColumnCell.h"
#import "ColumuViewModel.h"
#import "ColumuListViewController.h"
@interface ColumuViewController ()
@property (nonatomic)ColumuViewModel *allColumu;
@end

@implementation ColumuViewController

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _allColumu.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.iconImage setImageURL:[_allColumu icon:indexPath.item]];
    cell.gameName.text = [_allColumu title:indexPath.item];
    
    cell.contentView.layer.borderWidth = 0.5f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    CGFloat width = (long)((self.view.frame.size.width) - 3*10)/2;
    CGFloat height = width - 50;
    layout.itemSize = CGSizeMake(width, height);
    ColumuListViewController *list = [[ColumuListViewController alloc]initWithCollectionViewLayout:layout];
    list.slug = [_allColumu slugKey:indexPath.item];
    [self.navigationController pushViewController:list animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addSearchItemForVC:self clickedHandler:^{
        NSLog(@"点击");
    }];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ColumnCell class] forCellWithReuseIdentifier:@"cell"];
    __weak typeof (self) weakSelf = self;
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.allColumu getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [weakSelf.collectionView beginHeaderRefresh];
}
- (void)pop:(UIBarButtonItem*)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (ColumuViewModel *)allColumu {
	if(_allColumu == nil) {
		_allColumu = [[ColumuViewModel alloc] init];
	}
	return _allColumu;
}

@end

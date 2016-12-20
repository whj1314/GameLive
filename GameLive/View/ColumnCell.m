//
//  ColumnCell.m
//  GameLive
//
//  Created by tarena on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumnCell.h"

@implementation ColumnCell
- (UIView *)myView {
    if(_myView == nil) {
        _myView = [[UIView alloc] init];
        _myView.backgroundColor = [UIColor whiteColor];
        
        _myView.contentMode = UIViewContentModeScaleAspectFill;
        _myView.clipsToBounds = YES;
        _myView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        _myView.layer.shadowOffset = CGSizeMake(0, 0);
        _myView.layer.shadowRadius = 4.0f;
        _myView.layer.shadowOpacity = 0.5f;
        _myView.layer.masksToBounds = NO;
        
        [self.contentView addSubview:_myView];
        [_myView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _myView;
}
- (UIImageView *)iconImage {
    
    if(_iconImage == nil) {
        _iconImage = [[UIImageView alloc] init];
        [self.myView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
        }];
    }
    return _iconImage;
}

- (UILabel *)gameName {
    if(_gameName == nil) {
        _gameName = [[UILabel alloc] init];
        [self.myView addSubview:_gameName];
        [_gameName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-5);
            make.top.equalTo(self.iconImage.mas_bottom).equalTo(5);
        }];
    }
    return _gameName;
}

@end

//
//  LiveViewCell.m
//  GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveViewCell.h"

@implementation LiveViewCell

- (UIView *)myView {
    if(_myView == nil) {
        _myView = [[UIView alloc] init];
        [self peopleImage];
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

- (UIView *)blackView {
    if(_blackView == nil) {
        _blackView = [[UIView alloc] init];
        _blackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.iconImage addSubview:_blackView];
        [_blackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(20);
        }];
    }
    return _blackView;
}

- (UIImageView *)iconImage {
    if(_iconImage == nil) {
        _iconImage = [[UIImageView alloc] init];
        _iconImage.contentMode = UIViewContentModeScaleAspectFill;
        _iconImage.layer.masksToBounds = YES;
        [self.myView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(0);
        }];
    }
    return _iconImage;
}

- (UIImageView *)maike {
    if(_maike == nil) {
        _maike = [[UIImageView alloc] init];
        _maike.image = [UIImage imageNamed:@"主播名.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.3996.000.00.@1x"];
        [self.blackView addSubview:_maike];
        [_maike mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(3);
            make.width.equalTo(12);
            make.height.equalTo(12);
            make.centerY.equalTo(0);
        }];
    }
    return _maike;
}

- (UILabel *)playerName {
    if(_playerName == nil) {
        _playerName = [[UILabel alloc] init];
        _playerName.font = [UIFont systemFontOfSize:10];
        _playerName.textColor = [UIColor whiteColor];
        [self.blackView addSubview:_playerName];
        [_playerName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.maike.mas_right).equalTo(3);
            make.centerY.equalTo(0);
            make.width.equalTo(self.blackView.mas_width).multipliedBy(0.5);
        }];
    }
    return _playerName;
}

- (UIImageView *)peopleImage {
    if(_peopleImage == nil) {
        _peopleImage = [[UIImageView alloc] init];
        _peopleImage.image = [UIImage imageNamed:@"观看人数.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.41481.000.00.@1x"];
        [self.blackView addSubview:_peopleImage];
        [_peopleImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.readNum.mas_left).equalTo(-3);
            make.width.equalTo(12);
            make.height.equalTo(12);
            make.centerY.equalTo(0);
        }];
    }
    return _peopleImage;
}

- (UILabel *)readNum {
    if(_readNum == nil) {
        _readNum = [[UILabel alloc] init];
        _readNum.font = [UIFont systemFontOfSize:10];
        _readNum.textColor = [UIColor whiteColor];
        [self.blackView addSubview:_readNum];
        [_readNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
        }];
    }
    return _readNum;
}
- (UIView *)titleView {
    if(_titleView == nil) {
        _titleView = [[UIView alloc] init];
        [self.myView addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.bottom.equalTo(0);
            make.top.equalTo(self.iconImage.mas_bottom).equalTo(0);
            make.height.equalTo(26);
        }];
    }
    return _titleView;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        [self.titleView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(0);
            make.width.equalTo(self.titleView.mas_width);
        }];
    }
    return _title;
}
@end

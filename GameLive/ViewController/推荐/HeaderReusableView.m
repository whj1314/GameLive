//
//  HeaderReusableView.m
//  GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HeaderReusableView.h"

@implementation HeaderReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self icon];
        [self add];
        [self more];
    }
    return self;
}
- (UIImageView *)icon {
    if(_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.image = [UIImage imageNamed:@"栏目标题.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.22935.000.00.@1x"];
        [self addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(5);
            make.left.equalTo(10);
            make.width.equalTo(3);
            make.height.equalTo(15);
        }];
    }
    return _icon;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icon.mas_right).equalTo(5);
            make.centerY.equalTo(5);
        }];
    }
    return _title;
}

- (UIImageView *)add {
    if(_add == nil) {
        _add = [[UIImageView alloc] init];
        _add.image = [UIImage imageNamed:@"更多.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.4253.000.00.@1x"];
        [self addSubview:_add];
        [_add mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(12);
            make.height.equalTo(12);
            make.centerY.equalTo(5);
            make.right.equalTo(self.more.mas_left).equalTo(-5);
        }];
    }
    return _add;
}
- (UILabel *)more {
    if(_more == nil) {
        _more = [[UILabel  alloc]init];
        _more.text = @"更多";
        [self addSubview:_more];
        [_more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.centerY.equalTo(5);
        }];
    }
    return _more;
}
- (UIButton *)btn {
    if(_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
//        _btn.backgroundColor = [UIColor redColor];
        [_btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [self.more addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _btn;
}
- (void)btn:(UIButton *)sender{

    NSLog(@"jijijijiji");
}
@end

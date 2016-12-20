//
//  LogTableViewCell.m
//  GameLive
//
//  Created by tarena on 16/8/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LogTableViewCell.h"

@implementation LogTableViewCell
- (UIImageView *)passImage {
    if(_passImage == nil) {
        _passImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_passImage];
        [_passImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.width.equalTo(20);
            make.height.equalTo(20);
            make.left.equalTo(15);
        }];
    }
    return _passImage;
}

- (UITextField *)passText {
    if(_passText == nil) {
        _passText = [[UITextField alloc] init];
        [self.contentView addSubview:_passText];
        [_passText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.passImage.mas_right).equalTo(5);
            make.centerY.equalTo(0);
            make.width.equalTo(200);
        }];
    }
    return _passText;
}

- (UIButton *)getMsn {
    if(_getMsn == nil) {
        _getMsn = [[UIButton alloc] init];
        _getMsn.backgroundColor = [UIColor colorWithRed:255/255.0 green:50/255.0 blue:41/255.0 alpha:1.0];
        [_getMsn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getMsn.titleLabel.font = [UIFont systemFontOfSize:12];
        _getMsn.titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_getMsn];
        [_getMsn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-15);
            make.centerY.equalTo(0);
            make.width.equalTo(80);
            make.height.equalTo(30);
        }];
    }
    return _getMsn;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

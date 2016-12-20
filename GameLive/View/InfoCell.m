//
//  InfoCell.m
//  GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "InfoCell.h"

@implementation InfoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (UIImageView *)icon {
    if(_icon == nil) {
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.width.equalTo(20);
            make.height.equalTo(20);
            make.left.equalTo(15);
        }];
    }
    return _icon;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icon.mas_right).equalTo(15);
            make.centerY.equalTo(0);
        }];
    }
    return _title;
}

- (UILabel *)rightLb {
    if(_rightLb == nil) {
        _rightLb = [[UILabel alloc] init];
        _rightLb.font = [UIFont systemFontOfSize:12];
        _rightLb.textColor = [UIColor grayColor];
        [self.contentView addSubview:_rightLb];
        [_rightLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
        }];
    }
    return _rightLb;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

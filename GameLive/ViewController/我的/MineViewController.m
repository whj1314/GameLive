//
//  MineViewController.m
//  GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MineViewController.h"
#import "InfoCell.h"
#import "PanController.h"
#import "LogViewController.h"
#import "EmptyViewController.h"
@interface MineViewController ()
@property (nonatomic) UIView *headView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //不允许拖动
    self.tableView.scrollEnabled =NO;
    self.tableView.sectionFooterHeight = 10;
    [self.tableView registerClass:[InfoCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableHeaderView =self.headView;
}
- (UIView *)headView {
    if(_headView == nil) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 280)];
        _headView.backgroundColor = [UIColor whiteColor];
        UIImageView *bottomImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头像背景图@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.33447.000.00."]];
        [self.headView addSubview:bottomImage];
        bottomImage.userInteractionEnabled = YES;
        [bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(0);
            make.height.equalTo(200);
        }];
        UIImageView *image = [[UIImageView alloc]init];
        
        [bottomImage addSubview:image];
        image.image = [UIImage imageNamed:@"头像.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.63025.000.00.@1x"];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(80);
            make.height.equalTo(80);
            make.centerX.equalTo(0);
            make.centerY.equalTo(-30);
        }];
        UIButton *logBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [logBtn setTitle:@"登录" forState:UIControlStateNormal];
        logBtn.tintColor = [UIColor whiteColor];
        logBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [logBtn bk_addEventHandler:^(id sender) {
            LogViewController *log = [[LogViewController alloc]initWithStyle:UITableViewStyleGrouped];
            UINavigationController *ui = [[UINavigationController alloc]initWithRootViewController:log];
            NSLog(@"登录按钮蒙层被点击");
            [self.navigationController presentViewController:ui animated:NO completion:nil];;
        } forControlEvents:UIControlEventTouchUpInside];
        [bottomImage addSubview:logBtn];
        [logBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(25);
            make.height.equalTo(25);
            make.centerX.equalTo(0);
            make.top.equalTo(image.mas_bottom).equalTo(10);
        }];
        UIImageView *leftImage = [UIImageView new];
        leftImage.image = [UIImage imageNamed:@"站内私信"];
        [bottomImage addSubview:leftImage];
        [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(25);
            make.height.equalTo(25);
            make.left.equalTo(15);
            make.top.equalTo(15);
        }];
        UIImageView *rightImage = [UIImageView new];
        rightImage.image = [UIImage imageNamed:@"mask_barrage"];
        [bottomImage addSubview:rightImage];
        [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(25);
            make.height.equalTo(25);
            make.right.equalTo(-15);
            make.top.equalTo(15);
        }];
        UIView *blueView = [[UIView alloc]init];
        blueView.backgroundColor = [UIColor blueColor];
        blueView.layer.cornerRadius = 22.0;
        blueView.layer.masksToBounds = YES;
        [bottomImage addSubview:blueView];
        [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(200);
            make.height.equalTo(40);
            make.centerX.equalTo(0);
            make.top.equalTo(bottomImage.mas_bottom).equalTo(-20);
        }];
        UIButton *begin = [UIButton buttonWithType:UIButtonTypeSystem];
        [begin setTitle:@"开 始 直 播" forState:UIControlStateNormal];
        [begin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [begin setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        begin.titleLabel.textAlignment = NSTextAlignmentCenter;
        [begin bk_addEventHandler:^(id sender) {
            
        } forControlEvents:UIControlEventTouchUpInside];
        [blueView addSubview:begin];
        [begin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.centerY.equalTo(0);
            make.width.equalTo(180);
            make.height.equalTo(38);
        }];
        UIView *look = [[UIView alloc]init];
        [self.headView addSubview:look];
        [look mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bottomImage.mas_bottom).equalTo(20);
            make.width.equalTo(self.headView.mas_width).multipliedBy(0.25);
            make.left.equalTo(0);
            make.bottom.equalTo(0);
        }];
        UIImageView *lookImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"观看历史"]];
        [look addSubview:lookImage];
        [lookImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(-10);
            make.centerX.equalTo(0);
            make.width.equalTo(22);
            make.height.equalTo(22);
        }];
        UILabel *lookLb = [[UILabel alloc]init];
        lookLb.text = @"观看历史";
        lookLb.font = [UIFont systemFontOfSize:12];
        lookLb.textColor = [UIColor grayColor];
        [look addSubview:lookLb];
        [lookLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(lookImage.mas_bottom).equalTo(10);
        }];
        UIView *guanzhu = [[UIView alloc]init];
        [self.headView addSubview:guanzhu];
        [guanzhu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bottomImage.mas_bottom).equalTo(20);
            make.width.equalTo(self.headView.mas_width).multipliedBy(0.25);
            make.left.equalTo(look.mas_right);
            make.bottom.equalTo(0);
        }];
        UIImageView *guanzhuImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心关注"]];
        [guanzhu addSubview:guanzhuImage];
        [guanzhuImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(-10);
            make.centerX.equalTo(0);
            make.width.equalTo(22);
            make.height.equalTo(22);
        }];
        UILabel *guanzhuLb = [[UILabel alloc]init];
        guanzhuLb.text = @"关注管理";
        guanzhuLb.font = [UIFont systemFontOfSize:12];
        guanzhuLb.textColor = [UIColor grayColor];
        [guanzhu addSubview:guanzhuLb];
        [guanzhuLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(guanzhuImage.mas_bottom).equalTo(10);
        }];
        UIView *yuwan = [[UIView alloc]init];
        [self.headView addSubview:yuwan];
        [yuwan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bottomImage.mas_bottom).equalTo(20);
            make.width.equalTo(self.headView.mas_width).multipliedBy(0.25);
            make.left.equalTo(guanzhu.mas_right);
            make.bottom.equalTo(0);
        }];
        UIImageView *yuwanImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"鱼丸任务"]];
        [yuwan addSubview:yuwanImage];
        [yuwanImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(-10);
            make.centerX.equalTo(0);
            make.width.equalTo(22);
            make.height.equalTo(22);
        }];
        UILabel *yuwanLb = [[UILabel alloc]init];
        yuwanLb.text = @"鱼丸任务";
        yuwanLb.font = [UIFont systemFontOfSize:12];
        yuwanLb.textColor = [UIColor grayColor];
        [yuwan addSubview:yuwanLb];
        [yuwanLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(yuwanImage.mas_bottom).equalTo(10);
        }];
        UIView *yuchi = [[UIView alloc]init];
        [self.headView addSubview:yuchi];
        [yuchi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bottomImage.mas_bottom).equalTo(20);
            make.width.equalTo(self.headView.mas_width).multipliedBy(0.25);
            make.left.equalTo(yuwan.mas_right);
            make.bottom.equalTo(0);
        }];
        UIImageView *yuchiImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"鱼翅充值"]];
        [yuchi addSubview:yuchiImage];
        [yuchiImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(-10);
            make.centerX.equalTo(0);
            make.width.equalTo(22);
            make.height.equalTo(22);
        }];
        UILabel *yuchiLb = [[UILabel alloc]init];
        yuchiLb.text = @"鱼丸任务";
        yuchiLb.font = [UIFont systemFontOfSize:12];
        yuchiLb.textColor = [UIColor grayColor];
        [yuchi addSubview:yuchiLb];
        [yuchiLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(yuchiImage.mas_bottom).equalTo(10);
        }];
    }
    return _headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.icon.image = [UIImage imageNamed:@"发现-焦点.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.18619.000.00.@1x"];
            cell.title.text = @"开播提醒";
        }
        if (indexPath.row == 1) {
            cell.icon.image = [UIImage imageNamed:@"全屏送礼-按下.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.63386.000.00.@1x"];
            cell.title.text = @"清空缓存";
        }
        if (indexPath.row == 2) {
            cell.icon.image = [UIImage imageNamed:@"弹幕关闭-按下.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.63249.000.00.@1x"];
            cell.title.text = @"寻找女神";
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.icon.image = [UIImage imageNamed:@"播放-按下.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.41220.000.00.@1x"];
            cell.title.text = @"手游中心";
            cell.rightLb.text = @"玩游戏领跑车";
        }
    }
 
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            EmptyViewController *emp = [[EmptyViewController alloc]initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:emp animated:YES];
        }
        if (indexPath.row == 2) {
            PanController *pan = [[PanController alloc]init];
            [self.navigationController pushViewController:pan animated:NO];
        }
    }
}



@end

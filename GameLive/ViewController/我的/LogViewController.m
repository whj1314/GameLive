//
//  LogViewController.m
//  GameLive
//
//  Created by tarena on 16/8/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LogViewController.h"
#import "LogTableViewCell.h"
#import "RegistViewController.h"
#import "FriendsViewController.h"
@interface LogViewController ()
@property (nonatomic) UIView *headView;
@property (nonatomic) NSString *tellNumber;
@property (nonatomic) NSString *passNumber;
@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *logNameView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 30)];
    logNameView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
    self.tableView.tableFooterView = logNameView;
    UIButton *logBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [logBtn setTitle:@"登录" forState:UIControlStateNormal];
    [logBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    logBtn.layer.cornerRadius = 5;
    logBtn.layer.masksToBounds = YES;
    logBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:50/255.0 blue:41/255.0 alpha:1.0];
    [logBtn bk_addEventHandler:^(id sender) {
        BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
        if (!isAutoLogin) {
            EMError *error = [[EMClient sharedClient] loginWithUsername:self.tellNumber password:self.passNumber];
            if (!error) {
                //自动登录
                [[EMClient sharedClient].options setIsAutoLogin:YES];
                
                NSLog(@"登录成功");
                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                id vc = [sb instantiateViewControllerWithIdentifier:@"sunnan"];
                [self.navigationController presentViewController:vc animated:NO completion:nil];
            }else{
                NSLog(@"登陆错误%@",error.errorDescription);
            }
        }
    } forControlEvents:UIControlEventTouchUpInside];
    [logNameView addSubview:logBtn];
    [logBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.centerY.equalTo(0);
        make.width.equalTo(300);
        make.height.equalTo(30);
    }];
    self.tableView.tableHeaderView = self.headView;
    self.tableView.scrollEnabled =NO;
    [self.tableView registerClass:[LogTableViewCell class] forCellReuseIdentifier:@"cell"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"关闭-默认.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.42894.000.00.@1x"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBT:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    [Factory addJumpForVC:self andBtn:@"注册" clickedHandler:^{
        RegistViewController *re = [[RegistViewController alloc]initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:re animated:YES];
    }];
    //    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(rightBT:)];
    //    self.navigationItem.rightBarButtonItem = rightItem;
}
- (UIView *)headView {
    if(_headView == nil) {
        _headView = [[UIView alloc] initWithFrame:self.tableView.tableHeaderView.bounds];
        UIImageView *image = [[UIImageView alloc]init];
        image.image = [UIImage imageNamed:@"头像.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.63025.000.00.@1x"];
        image.layer.cornerRadius = 30;
        image.layer.masksToBounds = YES;
        //开启点击
        [image setUserInteractionEnabled:YES];
        //添加手势
        UIGestureRecognizer *singleTap = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
        [image addGestureRecognizer:singleTap];
        [self.headView addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(20);
            make.centerX.equalTo(0);
            make.width.equalTo(60);
            make.height.equalTo(60);
        }];
    }
    return _headView;
}
- (void)imageClick:(UIGestureRecognizer *)sender{
    NSLog(@"头像被点击");
}
- (void)leftBT:(UIBarButtonItem *)sender{
    NSLog(@"返回按钮被点击");
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
//- (void)rightBT:(UIBarButtonItem *)sender{
//    RegistViewController *re = [[RegistViewController alloc]initWithStyle:UITableViewStyleGrouped];
//    [self.navigationController pushViewController:re animated:YES];
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.passImage.image = [UIImage imageNamed:@"用户名.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.1881.000.00.@1x"];
        cell.passText.placeholder = @"请输入手机号";
        [cell.passText bk_addEventHandler:^(id sender) {
            self.tellNumber = cell.passText.text;
        } forControlEvents:UIControlEventEditingChanged];
    }
    if (indexPath.row == 1) {
        cell.passImage.image = [UIImage imageNamed:@"密码.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.9141.000.00.@1x"];
        cell.passText.placeholder = @"请输入密码";
        [cell.passText bk_addEventHandler:^(id sender) {
            self.passNumber = cell.passText.text;
        } forControlEvents:UIControlEventEditingChanged];
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end

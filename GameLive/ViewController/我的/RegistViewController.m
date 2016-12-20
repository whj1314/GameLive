//
//  RegistViewController.m
//  GameLive
//
//  Created by tarena on 16/8/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RegistViewController.h"
#import "LogTableViewCell.h"
@interface RegistViewController ()<UITextFieldDelegate>
@property (nonatomic) NSString *tellNumber;
@property (nonatomic) NSString *codeNumber;
@property (nonatomic) NSString *passNumber;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemForVC:self];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.tableView registerClass:[LogTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.scrollEnabled =NO;
    UIView *logNameView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 30)];
    logNameView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
    self.tableView.tableFooterView = logNameView;
    UIButton *logBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [logBtn setTitle:@"注册" forState:UIControlStateNormal];
    [logBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    logBtn.layer.cornerRadius = 5;
    logBtn.layer.masksToBounds = YES;
    logBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:50/255.0 blue:41/255.0 alpha:1.0];
    [logBtn bk_addEventHandler:^(id sender) {
        //环信
        EMError *error = [[EMClient sharedClient] registerWithUsername:self.tellNumber password:self.passNumber];
        if (error==nil) {
            NSLog(@"环信注册成功");
        }
        //短信
        [SMSSDK commitVerificationCode:self.codeNumber phoneNumber:self.tellNumber zone:@"86" result:^(NSError *error) {
            if (!error) {
                NSLog(@"短信注册成功");
            }
            else
            {
                NSLog(@"错误信息:%@",error);
            }
        }];
    } forControlEvents:UIControlEventTouchUpInside];
    [logNameView addSubview:logBtn];
    [logBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.centerY.equalTo(0);
        make.width.equalTo(300);
        make.height.equalTo(30);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.passText.delegate = self;
    if (indexPath.row == 0) {
        cell.passImage.image = [UIImage imageNamed:@"用户名.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.1881.000.00.@1x"];
        cell.passText.placeholder = @"请输入手机号";
        cell.passText.tag = indexPath.row;
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
    if (indexPath.row == 2) {
        cell.passText.placeholder = @"请输入验证码";
        cell.passText.tag = indexPath.row;
        [cell.passText bk_addEventHandler:^(id sender) {
            self.codeNumber  = cell.passText.text;
        } forControlEvents:UIControlEventEditingChanged];
        [cell.getMsn bk_addEventHandler:^(id sender) {
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.tellNumber zone:@"86" customIdentifier:nil result:^(NSError *error) {
                if (!error) {
                    NSLog(@"验证成功");
                }else{
                    NSLog(@"错误信息:%@",error);
                }
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}
- (void)bk{
}

@end

//
//  WelcomeViewController.m
//  GameLive
//
//  Created by tarena on 16/8/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WelcomeViewController.h"
@import AVFoundation;
#import "AppDelegate.h"
#import "MyBarController.h"
@interface WelcomeViewController ()
@property (nonatomic) AVPlayerLayer *player;
@end

@implementation WelcomeViewController
//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES; // 返回NO表示要显示，返回YES将hiden
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSURL *video = [[NSBundle mainBundle] URLForResource:@"dyla_movie" withExtension:@"mp4"];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:video];
    AVPlayer *play = [AVPlayer playerWithPlayerItem:item];
    _player = [AVPlayerLayer playerLayerWithPlayer:play];
    _player.frame = self.view.bounds;
    _player.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_player];
    [play play];
    //播放结束  添加监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playToEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:item];
}
- (void)playToEnd{
    [_player removeFromSuperlayer];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    self.view.window.rootViewController =[MyBarController new];
//    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
//    delegate.welcomeWindow.hidden = YES;
//    //释放欢迎控制器的指针索引
//    delegate.welcomeWindow.rootViewController = nil;
//    delegate.welcomeWindow = nil;
    
    
    
    //时机是动画播放结束
    //设置当前版本号为已读版本号
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *version = infoDic[@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"ReadVersion"];
    //要想立刻写入, 则调用
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
- (void)dealloc{
    NSLog(@"对象被释放");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

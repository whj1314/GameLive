//
//  AppDelegate.m
//  GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "MyBarController.h"
#import "WelcomeViewController.h"
@interface AppDelegate ()<EMClientDelegate>

@end

@implementation AppDelegate
- (UIWindow *)window {
    if(_window == nil) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        MyBarController *my = [[MyBarController alloc]init];
        self.window.rootViewController =my;
        [self.window makeKeyAndVisible];
    }
    return _window;
}

- (UIWindow *)welcomeWindow {
    if(_welcomeWindow == nil) {
        _welcomeWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _welcomeWindow.hidden = NO;
        _welcomeWindow.rootViewController = [WelcomeViewController new];
        _welcomeWindow.windowLevel = 1;
    }
    return _welcomeWindow;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //调用分类
    [self configApplication:launchOptions];

    //获取当前系统版本号
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSLog(@"%@", infoDic);
    NSString *version = infoDic[@"CFBundleShortVersionString"];
    //假设已经读取的版本号, key 是 ReadVersion
    NSString *readVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"ReadVersion"];
    
    if ([readVersion isEqualToString:version]) {
        [self window];
    }else{
        [self welcomeWindow];
        [self window];
    }
    
    
    [SMSSDK registerApp:@"15c77f99ecd80"
             withSecret:@"1e0e7d82433cc65978f833e676e00232"];
    
    
    //AppKey:注册的AppKey，详细见下面注释。
    //apnsCertName:推送证书名（不需要加后缀），详细见下面注释。
    EMOptions *options = [EMOptions optionsWithAppkey:@"1660626091#1604"];
    options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    //代理
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    
    return YES;
}
- (void)didAutoLoginWithError:(EMError *)aError{
     NSLog(@"%@",aError?aError:@"自动登陆成功");
}
- (void)didLoginFromOtherDevice{
    NSLog(@"当前登录账号在其它设备登录");
}
- (void)didRemovedFromServer{
    NSLog(@"当前登录账号已经被从服务器端删除");
}
- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   [[EMClient sharedClient] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  ShowTimeViewController.m
//  GameLive
//
//  Created by 王红军 on 2016/12/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ShowTimeViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
@interface ShowTimeViewController ()

/** 直播播放器 */
@property (nonatomic, strong) IJKFFMoviePlayerController *moviePlayer;

@property (nonatomic, copy) NSURL *url;

@end

@implementation ShowTimeViewController

- (instancetype)initWithURL:(NSURL *)URL{
    if (self = [super init]) {
        [self play:URL];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)play:(NSURL *)url{
    
    UIView *displayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    [self.view addSubview:displayView];
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    [options setPlayerOptionIntValue:1  forKey:@"videotoolbox"];
    [options setPlayerOptionIntValue:15 forKey:@"r"];
    [options setPlayerOptionIntValue:512 forKey:@"vol"];
    IJKFFMoviePlayerController *moviePlayer = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:options];;
    moviePlayer.view.frame = displayView.bounds;
    moviePlayer.scalingMode = IJKMPMovieScalingModeAspectFill;
    moviePlayer.shouldAutoplay = YES;
    moviePlayer.shouldShowHudView = NO;
    [displayView insertSubview:moviePlayer.view atIndex:0];
    [moviePlayer prepareToPlay];
    
    self.moviePlayer = moviePlayer;
    
}





bool isPortrait = true;

- (void)Horizontalscreen{
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    [UIView animateWithDuration:duration animations:^{
        [[UIApplication sharedApplication] setStatusBarOrientation:isPortrait ? UIInterfaceOrientationLandscapeRight : UIInterfaceOrientationPortrait];
        self.navigationController.view.transform = isPortrait ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity;
        self.navigationController.view.bounds = CGRectMake(self.navigationController.view.bounds.origin.x, self.navigationController.view.bounds.origin.y, self.view.frame.size.height, self.view.frame.size.width);
        isPortrait = !isPortrait;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

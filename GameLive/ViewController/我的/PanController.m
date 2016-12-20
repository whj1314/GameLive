//
//  PanController.m
//  GameLive
//
//  Created by tarena on 16/8/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "PanController.h"

@interface PanController ()

@end

@implementation PanController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Factory addBackItemForVC:self];
    
    self.view.backgroundColor = [UIColor whiteColor];
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.likedText = @"喜欢";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"讨厌";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:CGRectMake(100, 100, 200, 300)
                                                                     options:options];
    view.imageView.image = [UIImage imageNamed:@"head2"];
    [self.view addSubview:view];
}
//这就是当用户没有完全向左或向右滑动。
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}
/// /发送之前的选择。取消选择通过返回“不”。否则返回“是的”。
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        return YES;
    } else {
        // / /快速视图,取消选择。
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = [view superview].center;
        }];
        return NO;
    }
}
/// /这叫做然后用户刷视图完全向左或向右。
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else {
        NSLog(@"Photo saved!");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

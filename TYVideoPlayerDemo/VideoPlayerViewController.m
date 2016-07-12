//
//  VideoPlayerViewController.m
//  TYVideoPlayerDemo
//
//  Created by tany on 16/7/11.
//  Copyright © 2016年 tany. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import "TYVideoPlayerController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideoPlayerViewController ()
@property (nonatomic, weak) TYVideoPlayerController *playerController;
@end

@implementation VideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MPMoviePlayerController *p;
    [self addVideoPlayerController];
    
    [self loadVideo];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    CGRect bounds = self.view.frame;
    if (_playerController.isFullScreen) {
        _playerController.view.frame = CGRectMake(0, 0, MAX(CGRectGetHeight(bounds), CGRectGetWidth(bounds)), MIN(CGRectGetHeight(bounds), CGRectGetWidth(bounds)));
    }else {
         _playerController.view.frame = CGRectMake(0, 20, MIN(CGRectGetHeight(bounds), CGRectGetWidth(bounds)), MIN(CGRectGetHeight(bounds), CGRectGetWidth(bounds))*9/16);
    }
}

- (void)addVideoPlayerController
{
    TYVideoPlayerController *playerController = [[TYVideoPlayerController alloc]init];
    [self addChildViewController:playerController];
    [self.view addSubview:playerController.view];
    _playerController = playerController;
}

- (void)loadVideo
{
    NSURL *streamURL = [NSURL URLWithString:@"http://down.233.com/2014_2015/2014/jzs1/jingji_zhenti_yjw/6-qllgl2v5x9b80vvgwgzzlnzydkj1bpr66hnool80.mp4"];
    [_playerController loadVideoWithStreamURL:streamURL];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //发生在翻转开始之前。
    CGRect bounds = self.view.frame;
    [UIView animateWithDuration:duration animations:^{
        if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
             _playerController.view.frame = CGRectMake(0, 0, MAX(CGRectGetHeight(bounds), CGRectGetWidth(bounds)), MIN(CGRectGetHeight(bounds), CGRectGetWidth(bounds)));
        }else {
             _playerController.view.frame = CGRectMake(0, 20, MIN(CGRectGetHeight(bounds), CGRectGetWidth(bounds)), MIN(CGRectGetHeight(bounds), CGRectGetWidth(bounds))*9/16);
        }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
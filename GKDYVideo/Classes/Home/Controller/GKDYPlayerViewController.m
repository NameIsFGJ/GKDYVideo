//
//  GKDYPlayerViewController.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKDYPlayerViewController.h"

@interface GKDYPlayerViewController ()<GKDYVideoViewDelegate>
@property (strong, nonatomic)UIView *mainView;
@end

@implementation GKDYPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    //self.gk_statusBarHidden = YES;
    [self.view addSubview:self.videoView];
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


#pragma mark Delegate
- (void)videoView:(GKDYVideoView *)videoView didClickIcon:(IndexModel *)videoModel;
{
    NSLog(@" 点击了头像");
}
- (void)videoView:(GKDYVideoView *)videoView didClickPraise:(IndexModel *)videoModel{
    NSLog(@"点击了赞");
}
- (void)videoView:(GKDYVideoView *)videoView didClickComment:(IndexModel *)videoModel
{
    
}
- (void)videoView:(GKDYVideoView *)videoView didClickShare:(IndexModel *)videoModel
{
    
}
- (void)dealloc {
    [self.videoView destoryPlayer];
}

#pragma mark - 懒加载
- (GKDYVideoView *)videoView {
    if (!_videoView) {
        _videoView = [[GKDYVideoView alloc] initWithVC:self isPushed:NO];
        _videoView.delegate = self;
    }
    return _videoView;
}

@end

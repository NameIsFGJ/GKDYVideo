//
//  GKDYPlayerViewController.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKDYPlayerViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "BaseNavigationController.h"
#import "UnlikeVideoNetworking.h"
#import "LikeVideoNewtworking.h"
#import "UnflollowingNetworking.h"
#import "FlollowingNetworking.h"
#import "GetVideoCommentView.h"
#import "ShareView.h"
#import "GKDYUserMainViewController.h"
#import "GKDYUserVideoViewController.h"
@interface GKDYPlayerViewController ()<GKDYVideoViewDelegate>
@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) GetVideoCommentView *commentView;
@property (assign, nonatomic) BOOL isPush;
@property (strong, nonatomic) NSArray *videos;
@property (assign,nonatomic) NSInteger playIndex;

@end

@implementation GKDYPlayerViewController

// 单个视频
- (instancetype)initWithVideoModel:(IndexModel *)model;
{
    self = [super init];
    if (self)
    {
        self.isPush = YES;
    }
    return self;
}

// 播放一组视频,并指定播放位置
- (instancetype)initWithVideos:(NSArray *)videos index:(NSInteger)index;
{
    self = [super init];
    if (self)
    {
        self.videos = videos;
        self.isPush = YES;
        self.playIndex = index;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.view addSubview:self.videoView];
    [self makeNav];
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    if (self.isPush)
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self makeCommentView];
        [self.videoView.viewModel refreshNewListWithSuccess:^(NSArray * _Nonnull list) {
            [self.videoView setModels:self.videos index:self.playIndex];
        } failure:^(NSError * _Nonnull error) {
              
        }];
        
    }else
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self.videoView.viewModel refreshNewListWithSuccess:^(NSArray * _Nonnull list) {
            
        [self.videoView setModels:list index:0];
        } failure:^(NSError * _Nonnull error) {
            NSLog(@"error3=34  %@", error);
        }];
    }
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    //label.text = @"确认订单";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeCommentView
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(KStatusBarHeight);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    
    [leftButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
   // [leftButton setBackgroundColor:[UIColor redColor]];
    
    
    
    
    UITextField *commentView = [[UITextField alloc]init];
    [self.view addSubview:commentView];
    [commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(49);
    }];
    commentView.placeholder = @"   留下你的精彩评论~~~";
    // [textField1 setValue:[UIColor greenColor] forKeyPath:@"_placeholderLabel.textColor"];
    [commentView setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    //commentView.backgroundColor = [UIColor redColor];
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
   GKDYUserMainViewController *vc = [[GKDYUserMainViewController alloc]init];
    vc.userID = videoModel.user_id;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)videoView:(GKDYVideoView *)videoView didClickPraise:(IndexModel *)videoModel{
    
    if (videoModel.is_like) {
        [LikeVideoNewtworking postLikeVideo:kUser.user_token videoID:videoModel.identify completionHandle:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
            if (model.code == 1) {
                [self showNormalMsg:@"点赞取消"];
                [videoView.currentPlayView.praiseBtn setImage:[UIImage imageNamed:@"ss_icon_star_normal"] forState:UIControlStateNormal];
                                videoModel.is_like = 0;
                                videoModel.z_count = videoModel.z_count -1;
                                [videoView.currentPlayView.praiseBtn setTitle:[NSString stringWithFormat:@"%ld",videoModel.z_count] forState:UIControlStateNormal];
            }
        }];
    }else{
        [LikeVideoNewtworking postLikeVideo:kUser.user_token videoID:videoModel.identify completionHandle:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
            if (model.code == 1) {
                [self showNormalMsg:@"点赞成功"];
                [videoView.currentPlayView.praiseBtn setImage:[UIImage imageNamed:@"ss_icon_star_selected"] forState:UIControlStateNormal];
                videoModel.is_like = 1;
                videoModel.z_count = videoModel.z_count +1;
                [videoView.currentPlayView.praiseBtn setTitle:[NSString stringWithFormat:@"%ld",videoModel.z_count] forState:UIControlStateNormal];
            }
        }];
    }
}

- (void)videoView:(GKDYVideoView *)videoView didClickComment:(IndexModel *)videoModel
{
    GetVideoCommentView *commentView = [[GetVideoCommentView alloc]initWithFrame:CGRectMake(0, kWindowHeight, kWindowWidth, kWindowHeight) AndModel:videoModel];
    [[UIApplication sharedApplication].keyWindow addSubview:commentView];
    [commentView showView];
}

- (void)videoView:(GKDYVideoView *)videoView didClickShare:(IndexModel *)videoModel
{
    ShareView *shareView = [[ShareView alloc]init];
    shareView.frame = CGRectMake(0, kWindowHeight, kWindowWidth, kWindowHeight);
     [[UIApplication sharedApplication].keyWindow addSubview:shareView];
    [shareView showView];
}

- (void)videoView:(GKDYVideoView *)videoView didClickFollow:(IndexModel *)videoModel
{
    [FlollowingNetworking postFlollowing:kUser.user_token toUseID:videoModel.identify  completionHandle:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
        if (model.code == 1) {
            [self showSuccessMsg:@"操作成功"];
            [UIView animateWithDuration:.5 animations:^{
                self.videoView.currentPlayView.followingButton.hidden = YES;
            }];
        }else{
            [self showSuccessMsg:@"操作失败"];
        }
        //NSLog(@"")
    }];

}
// 判断是否登录
- (void)islogin
{
    if (![User isLogin])
    {
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
    }
}

- (void)dealloc {
    [self.videoView destoryPlayer];
}

#pragma mark - 懒加载
- (GKDYVideoView *)videoView {
    if (!_videoView) {
        _videoView = [[GKDYVideoView alloc] initWithVC:self isPushed:self.isPush];
        _videoView.delegate = self;
    }
    return _videoView;
}

@end

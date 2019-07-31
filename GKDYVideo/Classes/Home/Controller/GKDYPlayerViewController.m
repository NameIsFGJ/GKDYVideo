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
#import "LikeVideoNewtworking.h"
#import "UnlikeVideoNetworking.h"
#import "LikeVideoNewtworking.h"
#import "UnlikeVideoNetworking.h"
#import "GetVideoCommentView.h"
#import "ShareView.h"

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
    [self.view addSubview:self.videoView];
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    if (self.isPush)
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self.videoView.viewModel refreshNewListWithSuccess:^(NSArray * _Nonnull list) {
            
            NSLog(@"self.videos.count  =%ld",self.videos.count);
            NSLog(@"self.playIndex  =%ld",self.playIndex);
            [self.videoView setModels:self.videos index:self.playIndex];
        } failure:^(NSError * _Nonnull error) {
            
        }];
        
    }else
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self.videoView.viewModel refreshNewListWithSuccess:^(NSArray * _Nonnull list) {
            
            [self.videoView setModels:list index:0];
        } failure:^(NSError * _Nonnull error) {
            NSLog(@"error  %@", error);
        }];
    }
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
    NSLog(@" 点击头像");
}
- (void)videoView:(GKDYVideoView *)videoView didClickPraise:(IndexModel *)videoModel{
    
    [self islogin];
    [self islogin];

    if (videoModel.is_like)
    {
        [UnlikeVideoNetworking postUnLikeVideo:kUser.user_token userID:[kUser.user_id integerValue] videoID:videoModel.identify completionHandle:^(LikeVideoModel * _Nonnull model, NSError * _Nonnull error) {
            NSLog(@"1model.msg  =%@",model.msg);
            if (model.status == 1) {
                [self showNormalMsg:@"点赞取消"];
                [videoView.currentPlayView.praiseBtn setImage:[UIImage imageNamed:@"ss_icon_star_normal"] forState:UIControlStateNormal];
                videoModel.is_like = 0;
                videoModel.z_count = videoModel.z_count -1;
                [videoView.currentPlayView.praiseBtn setTitle:[NSString stringWithFormat:@"%ld",videoModel.z_count] forState:UIControlStateNormal];
            }
        }];
    }else{
        [LikeVideoNewtworking postLikeVideo:kUser.user_token userID:[kUser.user_id integerValue] videoID:videoModel.identify completionHandle:^(LikeVideoModel * _Nonnull model, NSError * _Nonnull error) {
            NSLog(@"2model.msg  =%@",model.msg);
            if (model.status == 1) {
                [self showNormalMsg:@"点赞成功"];
                [videoView.currentPlayView.praiseBtn setImage:[UIImage imageNamed:@"ss_icon_star_selected"] forState:UIControlStateNormal];
                videoModel.is_like = 1;
                videoModel.z_count = videoModel.z_count +1;
                [videoView.currentPlayView.praiseBtn setTitle:[NSString stringWithFormat:@"%ld",videoModel.z_count] forState:UIControlStateNormal];
            }else if (model.status == -9){
                [self showNormalMsg:@"无需重复点赞"];
            }
        }];
    }
}

- (void)videoView:(GKDYVideoView *)videoView didClickComment:(IndexModel *)videoModel
{
    [self islogin];
    GetVideoCommentView *commentView = [[GetVideoCommentView alloc]initWithFrame:CGRectMake(0, kWindowHeight, kWindowWidth, kWindowHeight) AndModel:videoModel];
    [[UIApplication sharedApplication].keyWindow addSubview:commentView];
    [commentView showView];
}

- (void)videoView:(GKDYVideoView *)videoView didClickShare:(IndexModel *)videoModel
{
    [self islogin];
    ShareView *shareView = [[ShareView alloc]init];
    shareView.frame = CGRectMake(0, kWindowHeight, kWindowWidth, kWindowHeight);
     [[UIApplication sharedApplication].keyWindow addSubview:shareView];
    [shareView showView];
}

- (void)videoView:(GKDYVideoView *)videoView didClickFollow:(IndexModel *)videoModel
{
    [self islogin];
    [LikeVideoNewtworking postLikeVideo:kUser.user_token userID:[kUser.user_id integerValue] videoID:videoModel.identify completionHandle:^(LikeVideoModel * _Nonnull model, NSError * _Nonnull error) {
        NSLog(@"model.status  =%ld",model.status);
        //关注成功：1，不能关注自己：-4，之前关注过：-5，关注已达上限数量：-6
        switch (model.status) {
            case 1:
                [self showNormalMsg:@"关注成功"];
                break;
            case -4:
                [self showNormalMsg:@"不能关注自己"];
                break;
            case -5:
                [self showNormalMsg:@"之前关注过"];
                break;
            case -6:
                [self showNormalMsg:@"关注已达上限数量"];
                break;
            default:
                break;
        }
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

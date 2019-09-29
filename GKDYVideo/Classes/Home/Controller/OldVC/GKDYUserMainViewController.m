//
//  GKDYUserMainViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDYUserMainViewController.h"
#import "UserHeadView.h"
#import "UserNetworking.h"
#import "FlollowingNetworking.h"
#import "UserModel.h"
#import "GKDYUserVideoViewController.h"
#import "UserVideoNetworking.h"
#import "MarketUserShopViewController.h"
@interface GKDYUserMainViewController ()<UserViewDelegaete>
@property (strong, nonatomic)UserHeadView *userView;
@property (strong, nonatomic)UserModel *model;
@property (strong, nonatomic)GKDYUserVideoViewController *myOwnerVC;
@property (strong, nonatomic)GKDYUserVideoViewController *myLikeVC;
@property (strong, nonatomic)UIView *lineView;
@property (strong, nonatomic)UIView *childView;
@property (strong, nonatomic) UIButton *myOwnerButton;
@property (strong, nonatomic) UIButton *myLikeButton;

@end

@implementation GKDYUserMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self makeNav];
    [self makeUI];
    [self networking];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"";
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"fenxiang_white"]   forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushViewController
{
    NSLog(@"分享");
}

- (void)makeUI
{
    self.userView = [[UserHeadView alloc]init];
    self.userView.delegate = self;
    [self.view addSubview:self.userView];
    
    [self.userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(200);
        make.top.mas_equalTo(KTopViewHeight);
    }];

    self.myOwnerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.myOwnerButton];
    [self.myOwnerButton setTitle:@"作品" forState:UIControlStateNormal];
    [self.myOwnerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.myOwnerButton.titleLabel.font = kFontSize(15);
    self.myLikeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.myLikeButton ];
    [self.myLikeButton setTitle:@"点赞" forState:UIControlStateNormal];
    [self.myLikeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.myLikeButton.titleLabel.font = kFontSize(15);
    
    [self.myOwnerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userView.mas_bottom);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2, 40));
    }];
    [self.myOwnerButton addTarget:self
                      action:@selector(myOwnerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.myLikeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userView.mas_bottom);
        make.left.equalTo(self.myOwnerButton.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2, 40));
    }];
    
    [self.myLikeButton  addTarget:self
                      action:@selector(myLikeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.myLikeButton .mas_bottom).offset(1);
        make.left.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake((kWindowWidth-24)/2, .5));
    }];
    
    [self.view addSubview:self.childView];
    [self.childView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-3);
        make.top.equalTo(self.lineView.mas_bottom).offset(3);
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
    }];
    
    self.childView.backgroundColor = [UIColor yellowColor];
    
    [self addChildViewController:self.myOwnerVC];
    [self.childView addSubview:self.myOwnerVC.view];
    
    [self addChildViewController:self.myLikeVC];
    [self.childView addSubview:self.myLikeVC.view];
    
}

- (void)networking
{         
    [UserNetworking postVideoGuanWithUserID:kUser.user_token withUserID:self.userID completion:^(UserModel * _Nonnull model, NSError * _Nonnull error) {
        
        self.model = model;
        
        // 头像
        [self.userView.headPicImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kSERVICE,model.head_pic]]];
        //  昵称
        self.userView.nickNameLabel.text = model.nickname;
        //  性别
        NSInteger sex = model.sex;
        if (sex == 1) {
            self.userView.sexImageView.image = [UIImage imageNamed:@"nan"];
        }else if (sex ==2){
            self.userView.sexImageView.image = [UIImage imageNamed:@"nv"];
        }
        
        // 关注
        if (model.is_guan) {
            [self.userView.guanButton setTitle:@"取消关注" forState:UIControlStateNormal];
            [self.userView.guanButton setBackgroundColor:[UIColor lightGrayColor]];
        }else{
             [self.userView.guanButton setTitle:@"+ 关注" forState:UIControlStateNormal];
            [self.userView.guanButton setBackgroundColor:[UIColor redColor]];
        }
        
        //获赞
        self.userView.zanNumberLabel.text = [NSString stringWithFormat:@"%ld 获赞",model.zan_num];
        //关注
        self.userView.guanNumberLabel.text = [NSString stringWithFormat:@"%ld 关注",model.guan_num];
        //粉丝
        self.userView.fansNumberLabel.text = [NSString stringWithFormat:@"%ld  粉丝",model.fans_num];
        
        // 签名
        self.userView.signsLabel.text = model.signs;
        
        // 漫饭号
        self.userView.mfNumLabel.text = [NSString stringWithFormat:@"漫饭号: %@",model.mf_num];
        
        // 定位
        [self.userView.cityButton setTitle:model.city forState:UIControlStateNormal];
        
        // 商铺
        self.userView.shopButton.hidden = !model.is_shop;
        
    }];
    
    [UserVideoNetworking postSomeBodyVideo:kUser.user_token withType:myOwnerVideo withPage:1 withUserID:self.userID complection:^(NSArray * _Nonnull array, NSError * _Nonnull error) {
        self.myOwnerVC.itemsArray = array;
        [self.myOwnerVC.mainView reloadData];
    }];
    
    [UserVideoNetworking postSomeBodyVideo:kUser.user_token withType:myLikeVideo withPage:1 withUserID:self.userID complection:^(NSArray * _Nonnull array, NSError * _Nonnull error) {
        self.myLikeVC.itemsArray = array;
        [self.myLikeVC.mainView reloadData];
    }];
}

#pragma makr 切换页面
- (void)myOwnerButtonAction{
    
    [self transitionFromViewController:self.myOwnerVC toViewController:self.myLikeVC duration:.2 options:UIViewAnimationOptionTransitionNone animations:^{
        
    } completion:^(BOOL finished) {
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.myLikeButton .mas_bottom).offset(1);
            make.left.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake((kWindowWidth-24)/2, .5));
        }];
    }];
}

- (void)myLikeButtonAction{
    
    [self transitionFromViewController:self.myLikeVC toViewController:self.myOwnerVC duration:.2 options:UIViewAnimationOptionTransitionNone animations:^{
        
    } completion:^(BOOL finished) {
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.myLikeButton .mas_bottom).offset(1);
            make.left.mas_equalTo(kWindowWidth/2);
            make.size.mas_equalTo(CGSizeMake((kWindowWidth-24)/2, .5));
        }];
    }];
}

#pragma mark UserHeadViewDelegate
// 关注
- (void)controlViewDidFollowing:(UserHeadView *)userView;
{
    if ([userView.guanButton.titleLabel.text isEqualToString:@"取消关注"])
    {
        [FlollowingNetworking postFlollowing:kUser.user_token toUseID:self.model.ide completionHandle:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error)
        {
            if (model.code == 1)
            {
                [userView.guanButton setTitle:@"+ 关注" forState:UIControlStateNormal];
                [userView.guanButton setBackgroundColor:[UIColor redColor]];
            }
        }];
    }else if ([userView.guanButton.titleLabel.text isEqualToString:@"+ 关注"])
    {
        [FlollowingNetworking postFlollowing:kUser.user_token toUseID:self.model.ide completionHandle:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
            if (model.code == 1)
            {
                [userView.guanButton setTitle:@"取消关注" forState:UIControlStateNormal];
                [userView.guanButton setBackgroundColor:[UIColor lightGrayColor]];
            }
        }];
    }
}

// TA 的商铺
- (void)controlViewDidTAShop:(UserHeadView *)userView;
{
    MarketUserShopViewController *vc = [[MarketUserShopViewController alloc]init];
    vc.userID = self.model.ide;
    vc.head_url = self.model.head_pic;
    vc.nickName = self.model.nickname;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

//  私信
- (void)controlViewDidMessage:(UserHeadView *)userView;
{
     NSLog(@"点击了私信");
}

#pragma mark 懒加载
- (GKDYUserVideoViewController *)myOwnerVC
{
    if (!_myOwnerVC) {
        _myOwnerVC = [[GKDYUserVideoViewController alloc]init];
        _myOwnerVC.view.frame = self.childView.frame;
        _myOwnerVC.vcType = myOwnerVideo;
    }
    return _myOwnerVC;
}

- (GKDYUserVideoViewController *)myLikeVC
{
    if (!_myLikeVC) {
        _myLikeVC = [[GKDYUserVideoViewController alloc]init];
        _myLikeVC.view.frame = self.childView.frame;
        _myLikeVC.vcType = myLikeVideo;
    }
    return _myLikeVC;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor orangeColor];
    }
    return _lineView;
}

- (UIView *)childView
{
    if (!_childView) {
        _childView = [[UIView alloc]init];
    }
    return _childView;
}
@end

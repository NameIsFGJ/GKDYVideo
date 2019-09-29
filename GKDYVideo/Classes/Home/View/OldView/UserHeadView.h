//
//  UserHeadView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UserHeadView;
/*
 @protocol GKDYVideoControlViewDelegate <NSObject>
 
 //暂停/开始
 - (void)controlViewDidClickSelf:(GKDYVideoControlView *)controlView;
 // 名称

 */

@protocol UserViewDelegaete <NSObject>

// 关注
- (void)controlViewDidFollowing:(UserHeadView *)userView;
// TA 的商铺
- (void)controlViewDidTAShop:(UserHeadView *)userView;
//  私信
- (void)controlViewDidMessage:(UserHeadView *)userView;
@end
@interface UserHeadView : UIView

@property (weak, nonatomic) id<UserViewDelegaete> delegate;
@property (strong, nonatomic)UIImageView *headPicImageView;
@property (strong, nonatomic)UILabel *nickNameLabel;
@property (strong, nonatomic)UIImageView *sexImageView;
@property (strong, nonatomic)UIButton *guanButton;
@property (strong, nonatomic)UILabel *mfNumLabel;
@property (strong, nonatomic)UIButton *cityButton;
@property (strong, nonatomic)UIButton *shopButton;
@property (strong, nonatomic)UIButton *messageButton;
@property (strong, nonatomic)UILabel *zanNumberLabel;
@property (strong, nonatomic)UILabel *guanNumberLabel;
@property (strong, nonatomic)UILabel *fansNumberLabel;
@property (strong, nonatomic)UILabel *signsLabel;
@end

NS_ASSUME_NONNULL_END

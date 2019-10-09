//
//  NewMineView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 @protocol GKDYVideoControlViewDelegate <NSObject>
 
 //暂停/开始
 - (void)controlViewDidClickSelf:(GKDYVideoControlView *)controlView;
 // 名称
 - (void)controlViewDidClickIcon:(GKDYVideoControlView *)controlView;
 // 点赞
 - (void)controlViewDidClickPriase:(GKDYVideoControlView *)controlView;
 // 评论
 - (void)controlViewDidClickComment:(GKDYVideoControlView *)controlView;
 // 分享
 - (void)controlViewDidClickShare:(GKDYVideoControlView *)controlView;
 // 关注
 - (void)controlViewDidClickFollow:(GKDYVideoControlView *)controlView;
 @end
 
 @interface GKDYVideoItemButton : UIButton
 
 @end
 
 
 @interface GKDYVideoControlView : UIView
 
 @property (nonatomic, weak) id<GKDYVideoControlViewDelegate> delegate;
 
 */
NS_ASSUME_NONNULL_BEGIN
@protocol MyHeadViewDelegate <NSObject>

// 我的饭圈
- (void)headViewTopicButtonClick;
// 会员
- (void)headViewMemberButtonClick;
// 查看所有订单
- (void)headViewOrderAllButtonClick;
// 待付款
- (void)headViewWaitPayButtonClick;
// 待发货
- (void)headViewWaitSendButtonClick;
// 待评价
- (void)headViewWaitDiscussButtonClick;
// 售后
- (void)headViewServeButtonClick;
// 余额
- (void)headViewMoneyButtonClick;
// 红包
- (void)headViewRedPacketButtonClick;
// 优惠券
- (void)headViewDiscountButtonClick;
@end
@interface NewMineView : UIView
@property (weak, nonatomic) id<MyHeadViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END

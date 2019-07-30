//
//  GKDYVideoControlView.h
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//  播放器视图控制层

#import <UIKit/UIKit.h>
#import "GKDYVideoModel.h"
#import "IndexModel.h"
#import "GetVideoCommentView.h"
NS_ASSUME_NONNULL_BEGIN

@class GKDYVideoControlView;

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

// 视频封面图:显示封面并播放视频
@property (nonatomic, strong) UIImageView       *coverImgView;

// 点赞按钮
@property (nonatomic, strong) GKDYVideoItemButton   *praiseBtn;
// 评论按钮
@property (nonatomic, strong) GKDYVideoItemButton   *commentBtn;
// 分享按钮
@property (nonatomic, strong) GKDYVideoItemButton   *shareBtn;

// 留言板
@property (nonatomic, strong) GetVideoCommentView *commentView;

@property (nonatomic, strong) IndexModel    *model;
- (void)setProgress:(float)progress;

- (void)startLoading;
- (void)stopLoading;

- (void)showPlayBtn;
- (void)hidePlayBtn;

@end

NS_ASSUME_NONNULL_END

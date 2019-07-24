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

- (void)controlViewDidClickSelf:(GKDYVideoControlView *)controlView;

- (void)controlViewDidClickIcon:(GKDYVideoControlView *)controlView;

- (void)controlViewDidClickPriase:(GKDYVideoControlView *)controlView;

- (void)controlViewDidClickComment:(GKDYVideoControlView *)controlView;

- (void)controlViewDidClickShare:(GKDYVideoControlView *)controlView;

@end

@interface GKDYVideoControlView : UIView

@property (nonatomic, weak) id<GKDYVideoControlViewDelegate> delegate;

// 视频封面图:显示封面并播放视频
@property (nonatomic, strong) UIImageView       *coverImgView;

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

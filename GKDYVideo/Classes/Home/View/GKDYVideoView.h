//
//  GKDYVideoView.h
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKDYVideoViewModel.h"
#import "GKDYVideoControlView.h"
#import "IndexModel.h"
NS_ASSUME_NONNULL_BEGIN

@class GKDYVideoView;
@protocol GKDYVideoViewDelegate <NSObject>

- (void)videoView:(GKDYVideoView *)videoView didClickIcon:(IndexModel *)videoModel;
- (void)videoView:(GKDYVideoView *)videoView didClickPraise:(IndexModel *)videoModel;
- (void)videoView:(GKDYVideoView *)videoView didClickComment:(IndexModel *)videoModel;
- (void)videoView:(GKDYVideoView *)videoView didClickShare:(IndexModel *)videoModel;

@end

@interface GKDYVideoView : UIView

@property (nonatomic, weak) id<GKDYVideoViewDelegate> delegate;

@property (nonatomic, strong) GKDYVideoViewModel    *viewModel;

@property (nonatomic, strong) GKDYVideoControlView      *currentPlayView;

- (instancetype)initWithVC:(UIViewController *)vc isPushed:(BOOL)isPushed;

- (void)setModels:(NSArray *)models index:(NSInteger)index;

- (void)pause;
- (void)resume;
- (void)destoryPlayer;

@end

NS_ASSUME_NONNULL_END

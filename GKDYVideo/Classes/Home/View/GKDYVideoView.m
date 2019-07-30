//
//  GKDYVideoView.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKDYVideoView.h"
#import "GKDYVideoPlayer.h"
#import "LikeVideoNewtworking.h"

@interface GKDYVideoView()<UIScrollViewDelegate, GKDYVideoPlayerDelegate, GKDYVideoControlViewDelegate>

@property (nonatomic, strong) UIScrollView              *scrollView;

// 创建三个控制视图，用于滑动切换
@property (nonatomic, strong) GKDYVideoControlView      *topView;   // 顶部视图
@property (nonatomic, strong) GKDYVideoControlView      *ctrView;   // 中间视图
@property (nonatomic, strong) GKDYVideoControlView      *btmView;   // 底部视图

// 控制播放的索引，不完全等于当前播放内容的索引
@property (nonatomic, assign) NSInteger                 index;

// 当前播放内容是索引
@property (nonatomic, assign) NSInteger                 currentPlayIndex;

@property (nonatomic, weak) UIViewController            *vc;
@property (nonatomic, assign) BOOL                      isPushed;

@property (nonatomic, strong) NSMutableArray            *videos;

@property (nonatomic, strong) GKDYVideoPlayer           *player;

// 记录播放内容
@property (nonatomic, copy) NSString                    *currentPlayId;

// 记录滑动前的播放状态
@property (nonatomic, assign) BOOL                      isPlaying_beforeScroll;

@property (assign, nonatomic)NSInteger viewHeight;

@end

@implementation GKDYVideoView
- (instancetype)initWithVC:(UIViewController *)vc isPushed:(BOOL)isPushed {
    if (self = [super init]) {
        self.vc = vc;
        self.isPushed = isPushed;
        
        [self addSubview:self.scrollView];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(-49);
        }];
        
        if (!isPushed) {
//            [self.viewModel refreshNewListWithSuccess:^(NSArray * _Nonnull list) {
//                [self setModels:list index:0];
//            } failure:^(NSError * _Nonnull error) {
//                NSLog(@"%@", error);
//            }];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat controlW = CGRectGetWidth(self.scrollView.frame);
    CGFloat controlH = CGRectGetHeight(self.scrollView.frame);
    self.viewHeight = kWindowHeight -49;
    self.topView.frame   = CGRectMake(0, 0, controlW, controlH);
    self.ctrView.frame   = CGRectMake(0, controlH, controlW, controlH);
    self.btmView.frame   = CGRectMake(0, 2 * controlH, controlW, controlH);
}

#pragma mark - Public Methods
- (void)setModels:(NSArray *)models index:(NSInteger)index {
    [self.videos removeAllObjects];
    [self.videos addObjectsFromArray:models];
    self.index = index;
    self.currentPlayIndex = index;
    
    if (models.count == 0) return;
    
    if (models.count == 1) {
        [self.ctrView removeFromSuperview];
        [self.btmView removeFromSuperview];
        
        self.scrollView.contentSize = CGSizeMake(0, kWindowHeight-49);
        
        self.topView.model = self.videos.firstObject;
        [self playVideoFrom:self.topView];
    }else if (models.count == 2) {
        [self.btmView removeFromSuperview];
        
        self.scrollView.contentSize = CGSizeMake(0, (kWindowHeight-49) * 2);
        
        self.topView.model = self.videos.firstObject;
        self.ctrView.model = self.videos.lastObject;
        
        if (index == 1) {
            self.scrollView.contentOffset = CGPointMake(0, self.viewHeight);
            [self playVideoFrom:self.topView];
        }else
        {
            [self playVideoFrom:self.topView];
        }
    }else {
        if (index == 0) {   // 如果是第一个，则显示上视图，且预加载中下视图
            self.topView.model = self.videos[index];
            self.ctrView.model = self.videos[index + 1];
            self.btmView.model = self.videos[index + 2];
            
            // 播放第一个
            [self playVideoFrom:self.topView];
        }else if (index == models.count - 1) { // 如果是最后一个，则显示最后视图，且预加载前两个
            self.btmView.model = self.videos[index];
            self.ctrView.model = self.videos[index - 1];
            self.topView.model = self.videos[index - 2];
            
            // 显示最后一个
            self.scrollView.contentOffset = CGPointMake(0, (kWindowHeight-49) * 2);
            // 播放最后一个
            [self playVideoFrom:self.btmView];
        }else { // 显示中间，播放中间，预加载上下
            self.ctrView.model = self.videos[index];
            self.topView.model = self.videos[index - 1];
            self.btmView.model = self.videos[index + 1];
            
            // 显示中间
            self.scrollView.contentOffset = CGPointMake(0, (kWindowHeight-49));
            // 播放中间
            [self playVideoFrom:self.ctrView];
        }
    }
}

- (void)pause {
    if (self.player.isPlaying) {
        self.isPlaying_beforeScroll = YES;
    }else {
        self.isPlaying_beforeScroll = NO;
    }
    
    [self.player pause];
}

- (void)resume {
    if (self.isPlaying_beforeScroll) {
        [self.player resume];
    }
}

- (void)destoryPlayer {
    self.scrollView.delegate = nil;
    [self.player removeVideo];
}

#pragma mark - Private Methods
- (void)playVideoFrom:(GKDYVideoControlView *)fromView {
    // 移除原来的播放
    [self.player removeVideo];
    
    // 取消原来视图的代理
    self.currentPlayView.delegate = nil;
    
    // 切换播放视图
    self.currentPlayId    = [NSString stringWithFormat:@"%ld",fromView.model.identify];
    self.currentPlayView  = fromView;
    self.currentPlayIndex = [self indexOfModel:fromView.model];
    // 设置新视图的代理
    self.currentPlayView.delegate = self;
    
    // 重新播放
    [self.player playVideoWithView:fromView.coverImgView url:fromView.model.video_url];
//    @weakify(self);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        @strongify(self);
//        [self.player playVideoWithView:fromView.coverImgView url:fromView.model.video_url];
//    });
    
}

// 获取当前播放内容的索引
- (NSInteger)indexOfModel:(IndexModel *)model {
    __block NSInteger index = 0;
    [self.videos enumerateObjectsUsingBlock:^(IndexModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (model.identify  ==obj.identify) {
            index = idx;
        }
    }];
    return index;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 小于等于三个，不用处理
    if (self.videos.count <= 3) return;
    
    // 上滑到第一个
    if (self.index == 0 && scrollView.contentOffset.y <= (kWindowHeight-49)) {
        return;
    }
    
    // 下滑到最后一个
    if (self.index == self.videos.count - 1 && scrollView.contentOffset.y > (kWindowHeight-49)) {
        return;
    }
    
    // 判断是从中间视图上滑还是下滑
    if (scrollView.contentOffset.y >= 2 * (kWindowHeight-49)) {  // 上滑
        [self.player removeVideo];  // 在这里移除播放，解决闪动的bug
        if (self.index == 0) {
            self.index += 2;
            
            scrollView.contentOffset = CGPointMake(0, (kWindowHeight-49));
            
            self.topView.model = self.ctrView.model;
            self.ctrView.model = self.btmView.model;
            
        }else {
            self.index += 1;
            
            if (self.index == self.videos.count - 1) {
                self.ctrView.model = self.videos[self.index - 1];
            }else {
                scrollView.contentOffset = CGPointMake(0, (kWindowHeight-49));
                
                self.topView.model = self.ctrView.model;
                self.ctrView.model = self.btmView.model;
            }
        }
        if (self.index < self.videos.count - 1) {
            self.btmView.model = self.videos[self.index + 1];
        }
    }else if (scrollView.contentOffset.y <= 0) { // 下滑
        [self.player removeVideo];  // 在这里移除播放，解决闪动的bug
        if (self.index == 1) {
            self.topView.model = self.videos[self.index - 1];
            self.ctrView.model = self.videos[self.index];
            self.btmView.model = self.videos[self.index + 1];
            self.index -= 1;
        }else {
            if (self.index == self.videos.count - 1) {
                self.index -= 2;
            }else {
                self.index -= 1;
            }
          scrollView.contentOffset = CGPointMake(0, (kWindowHeight-49));
            
            self.btmView.model = self.ctrView.model;
            self.ctrView.model = self.topView.model;
            
            if (self.index > 0) {
                self.topView.model = self.videos[self.index - 1];
            }
        }
    }
}

// 结束滚动后开始播放
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y == 0) {
        if ([self.currentPlayId isEqualToString:[NSString stringWithFormat:@"%ld", self.topView.model.identify]]) return;
        [self playVideoFrom:self.topView];
    }else if (scrollView.contentOffset.y == (kWindowHeight-49) ) {
        if ([self.currentPlayId isEqualToString:[NSString stringWithFormat:@"%ld",self.ctrView.model.identify]]) return;
        [self playVideoFrom:self.ctrView];
    }else if (scrollView.contentOffset.y == 2 * (kWindowHeight-49)) {
        if ([self.currentPlayId isEqualToString:[NSString stringWithFormat:@"%ld",self.btmView.model.identify]]) return;
        [self playVideoFrom:self.btmView];
    }
    
    if (self.isPushed) return;
    
    // 当只剩最后两个的时候，获取新数据
    if (self.currentPlayIndex == self.videos.count - 2) {
        [self.viewModel refreshNewListWithSuccess:^(NSArray * _Nonnull list) {
            [self.videos addObjectsFromArray:list];
        } failure:^(NSError * _Nonnull error) {
            NSLog(@"%@", error);
        }];
    }
}

#pragma mark - GKDYVideoPlayerDelegate
- (void)player:(GKDYVideoPlayer *)player statusChanged:(GKDYVideoPlayerStatus)status {
    switch (status) {
        case GKDYVideoPlayerStatusUnload:   // 未加载
            
            break;
        case GKDYVideoPlayerStatusPrepared:   // 准备播放
            
            break;
        case GKDYVideoPlayerStatusLoading: {     // 加载中
            [self.currentPlayView startLoading];
            [self.currentPlayView hidePlayBtn];
        }
            break;
        case GKDYVideoPlayerStatusPlaying: {    // 播放中
            [self.currentPlayView stopLoading];
            [self.currentPlayView hidePlayBtn];
        }
            break;
        case GKDYVideoPlayerStatusPaused: {     // 暂停
            [self.currentPlayView stopLoading];
            [self.currentPlayView showPlayBtn];
        }
            break;
        case GKDYVideoPlayerStatusEnded:   // 停止
            
            break;
        case GKDYVideoPlayerStatusError:   // 错误
            
            break;
            
        default:
            break;
    }
}

- (void)player:(GKDYVideoPlayer *)player currentTime:(float)currentTime totalTime:(float)totalTime progress:(float)progress {
    [self.currentPlayView setProgress:progress];
}

#pragma mark - GKDYVideoControlViewDelegate
- (void)controlViewDidClickSelf:(GKDYVideoControlView *)controlView {
    if (self.player.isPlaying)
    {
        [self.player pause];
    }else {
        [self.player resume];
    }
}

- (void)controlViewDidClickIcon:(GKDYVideoControlView *)controlView
{
    if ([self.delegate respondsToSelector:@selector(videoView:didClickIcon:)]) {
        [self.delegate videoView:self didClickIcon:controlView.model];
    }
}

- (void)controlViewDidClickPriase:(GKDYVideoControlView *)controlView
{
    if ([self.delegate respondsToSelector:@selector(videoView:didClickPraise:)])
    {
        [self.delegate videoView:self didClickPraise:controlView.model];
    }
}

- (void)controlViewDidClickComment:(GKDYVideoControlView *)controlView
{
    if ([self.delegate respondsToSelector:@selector(videoView:didClickComment:)]) {
        [self.delegate videoView:self didClickComment:controlView.model];
    }
}

- (void)controlViewDidClickShare:(GKDYVideoControlView *)controlView {
    if ([self.delegate respondsToSelector:@selector(videoView:didClickShare:)]) {
        [self.delegate videoView:self didClickShare:controlView.model];
    }
}
- (void)controlViewDidClickFollow:(GKDYVideoControlView *)controlView{
    if ([self.delegate respondsToSelector:@selector(videoView:didClickFollow:)]) {
        [self.delegate videoView:self didClickFollow:controlView.model];
    }
}

#pragma mark - lazy load
- (GKDYVideoViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [GKDYVideoViewModel new];
    }
    return _viewModel;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        
        [_scrollView addSubview:self.topView];
        [_scrollView addSubview:self.ctrView];
        [_scrollView addSubview:self.btmView];
        _scrollView.contentSize = CGSizeMake(0, (kWindowHeight-49) * 3);
        
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
    return _scrollView;
}

- (GKDYVideoControlView *)topView {
    if (!_topView) {
        _topView = [GKDYVideoControlView new];
    }
    return _topView;
}

- (GKDYVideoControlView *)ctrView {
    if (!_ctrView) {
        _ctrView = [GKDYVideoControlView new];
    }
    return _ctrView;
}

- (GKDYVideoControlView *)btmView {
    if (!_btmView) {
        _btmView = [GKDYVideoControlView new];
    }
    return _btmView;
}

- (NSMutableArray *)videos {
    if (!_videos) {
        _videos = [NSMutableArray new];
    }
    return _videos;
}

- (GKDYVideoPlayer *)player {
    if (!_player) {
        _player = [GKDYVideoPlayer new];
        _player.delegate = self;
    }
    return _player;
}



@end

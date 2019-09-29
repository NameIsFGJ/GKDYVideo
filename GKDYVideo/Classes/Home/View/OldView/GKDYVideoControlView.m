//
//  GKDYVideoControlView.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKDYVideoControlView.h"
#import "GKSliderView.h"

@implementation GKDYVideoItemButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView sizeToFit];
    [self.titleLabel sizeToFit];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGFloat imgW = self.imageView.frame.size.width;
    CGFloat imgH = self.imageView.frame.size.height;
    
    self.imageView.frame = CGRectMake((width - imgH) / 2, 0, imgW, imgH);
    
    CGFloat titleW = self.titleLabel.frame.size.width;
    CGFloat titleH = self.titleLabel.frame.size.height;
    
    self.titleLabel.frame = CGRectMake((width - titleW) / 2, height - titleH, titleW, titleH);
}

@end

@interface GKDYVideoControlView()

@property (nonatomic, strong) UIImageView           *iconView;

@property (nonatomic, strong) UILabel               *nameLabel;
@property (nonatomic, strong) UILabel               *contentLabel;
@property (nonatomic, strong) GKSliderView          *sliderView;
@property (strong, nonatomic)UIImageView *headImageView;
@property (nonatomic, strong) UIActivityIndicatorView   *loadingView;
@property (nonatomic, strong) UIButton                  *playBtn;


@end

@implementation GKDYVideoControlView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.coverImgView];
        [self addSubview:self.iconView];
        [self addSubview:self.praiseBtn];
        [self addSubview:self.commentBtn];
        [self addSubview:self.shareBtn];
        [self addSubview:self.followingButton];
        [self addSubview:self.nameLabel];
        [self addSubview:self.headImageView];
        [self addSubview:self.contentLabel];
        [self addSubview:self.sliderView];
        
        [self addSubview:self.loadingView];
        [self addSubview:self.playBtn];
        
        // 留言板
        [self addSubview:self.commentView];
        
        [self.coverImgView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.edges.equalTo(self);
        }];
        
        CGFloat bottomM = IS_iPhoneX ? (34.0f + ADAPTATIONRATIO * 40.0f) : ADAPTATIONRATIO * 40.0f;
        
        [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self).offset(-bottomM);
            make.height.mas_equalTo(ADAPTATIONRATIO * 2.0f);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(ADAPTATIONRATIO * 30.0f);
            make.bottom.equalTo(self.sliderView).offset(-ADAPTATIONRATIO * 30.0f);
            make.width.mas_equalTo(ADAPTATIONRATIO * 504.0f);
        }];
        
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentLabel);
            make.size.mas_equalTo(CGSizeMake(ADAPTATIONRATIO *56,ADAPTATIONRATIO *56));
            make.bottom.equalTo(self.contentLabel.mas_top).offset(-ADAPTATIONRATIO * 20.0f);
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImageView.mas_right).offset(20*ADAPTATIONRATIO);
            make.bottom.equalTo(self.headImageView);
        }];
        
        [self.followingButton mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(self.nameLabel.mas_right).offset(20*ADAPTATIONRATIO);
             make.size.mas_equalTo(CGSizeMake(30, 15));
             make.bottom.equalTo(self.headImageView);
        }];
        
        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-ADAPTATIONRATIO * 20.0f);
            make.bottom.equalTo(self.nameLabel.mas_top).offset(-ADAPTATIONRATIO * 50.0f);
            make.height.mas_equalTo(ADAPTATIONRATIO * 110.0f);
        }];
        
        [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.shareBtn);
            make.bottom.equalTo(self.shareBtn.mas_top).offset(-ADAPTATIONRATIO * 45.0f);
            make.height.mas_equalTo(ADAPTATIONRATIO * 110.0f);
        }];
        
        [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.shareBtn);
            make.bottom.equalTo(self.commentBtn.mas_top).offset(-ADAPTATIONRATIO * 45.0f);
            make.height.mas_equalTo(ADAPTATIONRATIO * 110.0f);
        }];
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.shareBtn);
            make.bottom.equalTo(self.praiseBtn.mas_top).offset(-ADAPTATIONRATIO * 70.0f);
            make.width.height.mas_equalTo(ADAPTATIONRATIO * 100.0f);
        }];
        
        [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
        [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
        [self.playBtn addTarget:self action:@selector(controlViewDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(controlViewDidClick:)];
        [self addGestureRecognizer:tap];
        
        
        // 留言板
        [self.commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_bottom);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(430);
        }];
        
    }
    return self;
}

- (void)setModel:(IndexModel *)model {
    _model = model;
    // 背景图
    [self.coverImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kSERVICE,model.pic_url]]];
    // 头像
    NSString *head_pic = [model.user objectForKey:@"head_pic"];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kSERVICE,head_pic]]];
    // 昵称
    NSString *nickname = [model.user objectForKey:@"nickname"];
    self.nameLabel.text = nickname;
    // 标题
    self.contentLabel.text = model.desc;
    //点赞
    [self.praiseBtn setTitle:[NSString stringWithFormat:@"%ld",model.z_count] forState:UIControlStateNormal];
    //评论
    [self.commentBtn setTitle:[NSString stringWithFormat:@"%ld",model.c_count] forState:UIControlStateNormal];
    //分享
    [self.shareBtn setTitle:[NSString stringWithFormat:@"%ld",model.share_count] forState:UIControlStateNormal];
    
    NSString *praiseImag = model.is_like ? @"ss_icon_star_selected":@"ss_icon_star_normal";
    [self.praiseBtn setImage:[UIImage imageNamed:praiseImag] forState:UIControlStateNormal];
    
   // NSLog(@"%@",model);
    //关注按钮
    self.followingButton.hidden = model.is_guan? YES: NO;
}

#pragma mark - Public Methods
- (void)setProgress:(float)progress {
    self.sliderView.value = progress;
}

- (void)startLoading {
    [self.loadingView startAnimating];
}

- (void)stopLoading {
    [self.loadingView stopAnimating];
}

- (void)showPlayBtn {
    self.playBtn.hidden = NO;
}

- (void)hidePlayBtn {
    self.playBtn.hidden = YES;
}

#pragma mark - Actionsel
- (void)controlViewDidClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(controlViewDidClickSelf:)]) {
        [self.delegate controlViewDidClickSelf:self];
    }
}

- (void)iconDidClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(controlViewDidClickIcon:)]) {
        [self.delegate controlViewDidClickIcon:self];
    }
}

- (void)praiseBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(controlViewDidClickPriase:)]) {
        [self.delegate controlViewDidClickPriase:self];
    }
}

- (void)commentBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(controlViewDidClickComment:)]) {
        [self.delegate controlViewDidClickComment:self];
    }
}

- (void)shareBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(controlViewDidClickShare:)]) {
        [self.delegate controlViewDidClickShare:self];
    }
}

- (void)followBtnClick:(id)sender{
    if ([self.delegate respondsToSelector:@selector(controlViewDidClickFollow:)]) {
        [self.delegate controlViewDidClickFollow:self];
    }
}

#pragma mark - 懒加载
- (UIImageView *)coverImgView {
    if (!_coverImgView) {
        _coverImgView = [UIImageView new];
        _coverImgView.contentMode = UIViewContentModeScaleAspectFill;
        _coverImgView.clipsToBounds = YES;
    }
    return _coverImgView;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [UIImageView new];
        _iconView.layer.cornerRadius = ADAPTATIONRATIO * 50.0f;
        _iconView.layer.masksToBounds = YES;
        _iconView.layer.borderColor = kWhiteColor.CGColor;
        _iconView.layer.borderWidth = 1.0f;
        _iconView.userInteractionEnabled = YES;
        _iconView.hidden = YES;
        UITapGestureRecognizer *iconTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconDidClick:)];
        [_iconView addGestureRecognizer:iconTap];
    }
    return _iconView;
}

- (GKDYVideoItemButton *)praiseBtn {
    if (!_praiseBtn) {
        _praiseBtn = [GKDYVideoItemButton new];
        _praiseBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [_praiseBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_praiseBtn addTarget:self action:@selector(praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praiseBtn;
}

- (GKDYVideoItemButton *)commentBtn {
    if (!_commentBtn) {
        _commentBtn = [GKDYVideoItemButton new];
        [_commentBtn setImage:[UIImage imageNamed:@"ss_icon_comment"] forState:UIControlStateNormal];
        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [_commentBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_commentBtn addTarget:self action:@selector(commentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentBtn;
}

- (GKDYVideoItemButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [GKDYVideoItemButton new];
        [_shareBtn setImage:[UIImage imageNamed:@"ss_icon_share"] forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [_shareBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textColor = kWhiteColor;
        _nameLabel.font = [UIFont boldSystemFontOfSize:15.0f];
        _nameLabel.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *nameTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconDidClick:)];
        [_nameLabel addGestureRecognizer:nameTap];
    }
    return _nameLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 3;
        _contentLabel.textColor = kWhiteColor;
        _contentLabel.font = [UIFont systemFontOfSize:14.0f];
    }
    return _contentLabel;
}

- (GKSliderView *)sliderView {
    if (!_sliderView) {
        _sliderView = [GKSliderView new];
        _sliderView.isHideSliderBlock = YES;
        _sliderView.sliderHeight = ADAPTATIONRATIO * 2.0f;
        _sliderView.maximumTrackTintColor = [UIColor grayColor];
        _sliderView.minimumTrackTintColor = kWhiteColor;
        _sliderView.hidden = YES;
    }
    return _sliderView;
}

- (UIActivityIndicatorView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _loadingView.hidesWhenStopped = YES;
    }
    return _loadingView;
}

- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [UIButton new];
        [_playBtn setImage:[UIImage imageNamed:@"ss_icon_pause"] forState:UIControlStateNormal];
        _playBtn.hidden = YES;
    }
    return _playBtn;
}

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [UIImageView new];
        _headImageView.layer.cornerRadius = ADAPTATIONRATIO * 28.0f;
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.borderColor = kWhiteColor.CGColor;
        _headImageView.layer.borderWidth = 1.0f;
        _headImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *iconTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconDidClick:)];
        [_headImageView addGestureRecognizer:iconTap];
    }
    return _headImageView;
}

- (UIButton *)followingButton
{
    if (!_followingButton) {
        _followingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _followingButton.backgroundColor = [UIColor redColor];
        [_followingButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_followingButton setTitle:@"关注" forState:UIControlStateNormal];
        _followingButton.titleLabel.font = [UIFont systemFontOfSize:20 *ADAPTATIONRATIO];
        _followingButton.layer.cornerRadius = 3;
        _followingButton.layer.masksToBounds = YES;
        [_followingButton addTarget:self action:@selector(followBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _followingButton;
}

- (GetVideoCommentView *)commentView
{
    if (!_commentView)
    {
        _commentView = [[GetVideoCommentView alloc]init];
    }
    return _commentView;
}

@end

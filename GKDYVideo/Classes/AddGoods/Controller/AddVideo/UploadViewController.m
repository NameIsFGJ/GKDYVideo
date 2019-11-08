//
//  UploadViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UploadViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerView.h"
#import "QiniuTokenNetworking.h"
#import "AppDelegate.h"
#import "UploadVideoNetworking.h"
#import "SuccessVideoViewController.h"
@interface UploadViewController ()<PLShortVideoUploaderDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate>
{
        id _timeObserver;
}
// 工具视图
@property (strong, nonatomic) UIView *baseToolboxView;
@property (strong, nonatomic) UIView *processerToolboxView;

@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UISlider *playSlider;
@property (strong, nonatomic) UILabel * currentTime;
@property (strong, nonatomic) UILabel * duration;

// 视频播放
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) PlayerView *playerView;
@property (strong, nonatomic) UIProgressView *processView;
@property (strong, nonatomic) MBProgressHUD *progress;
// gif 图预览
//@property (strong, nonatomic) FLAnimatedImageView *gifView;

// 上传视频到云端
@property (strong, nonatomic) UIButton *uploadButton;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) PLShortVideoUploader *shortVideoUploader;

// 定时器监听
@property (strong, nonatomic) NSTimer * timer;

@property (strong, nonatomic) NSString *QiniuToken;
@property (strong, nonatomic) NSString *QiniuUrl;

@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) UITextField *titleTextField;
@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationController.navigationBarHidden = YES;

    if (self.actionType == PLSActionTypePlayer) {
        
    }
    
    // 配置工具视图
    [self setupToolboxUI];
    
    // 配置内容视图
    [self setupContentView];
    
    // 文件上传（可上传视频、Gif 等）
    [self setupFileUpload];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.actionType == PLSActionTypePlayer) {
        [self.player play];
    }
    
    [self addObserver];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (self.actionType == PLSActionTypePlayer) {
        [self.player pause];
    }
    if (self.actionType == PLSActionTypeGif) {
       // self.gifView.animatedImage = nil;
    }
    
    [self removeTimeObserver];
}

-(void)addObserver {
    if (_timeObserver) return;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerToEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
    
    __weak typeof(self) weakSelf = self;
    _timeObserver = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float process = CMTimeGetSeconds(time) / CMTimeGetSeconds(weakSelf.player.currentItem.duration);
        weakSelf.playSlider.value = process;
        weakSelf.currentTime.text = [NSString stringWithFormat:@"%.2fs", CMTimeGetSeconds(time)];
        weakSelf.duration.text = [NSString stringWithFormat:@"%.2f", CMTimeGetSeconds(weakSelf.player.currentItem.duration)];
    }];
}

- (void)removeTimeObserver {
    if (_timeObserver) {
        [self.player removeTimeObserver:_timeObserver];
        _timeObserver = nil;
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
    }
}

- (void)playerToEnd:(NSNotification *)info {
    if (info.object == self.player.currentItem) {
        [self.player seekToTime:kCMTimeZero];
        [self.player play];
    }
}
#pragma mark 封面图
- (void)getImageView
{
//      AVAsset *asset = self.movieSettings[PLSAssetKey];
//       CGSize size = [asset pls_videoSize];
}


#pragma mark -- 视图配置
- (void)setupToolboxUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.baseToolboxView = [[UIView alloc] init];
    [self.view addSubview:self.baseToolboxView];
    self.baseToolboxView.backgroundColor = [UIColor clearColor];
    [self.baseToolboxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(64);
    }];
    
    //关闭按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.baseToolboxView addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self.baseToolboxView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [backButton setImage:[UIImage imageNamed:@"blackBack"]
                forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateHighlighted];
    
   // [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.baseToolboxView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 64));
        make.center.equalTo(self.baseToolboxView);
    }];
    
    [titleLabel setText:@"发布视频"];
    [titleLabel setFont:[UIFont systemFontOfSize:17]];
    
    self.uploadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.uploadButton setTitle:@"上传" forState:UIControlStateNormal];
    [self.uploadButton setTitle:@"取消" forState:UIControlStateSelected];
    [self.uploadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.uploadButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    //self.uploadButton.frame = CGRectMake(kWindowWidth - 80, 0, 80, 64);
    self.uploadButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.uploadButton addTarget:self action:@selector(uploadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.baseToolboxView addSubview:self.uploadButton];
    
    UIView *lineView = [[UIView alloc]init];
    [self.baseToolboxView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kWindowWidth, .3));
        make.bottom.mas_equalTo(1);
        make.left.right.mas_equalTo(0);
    }];
    
    lineView.backgroundColor = [UIColor lightGrayColor];
}

- (void)setupContentView
{
    self.titleTextField = [[UITextField alloc]init];
    [self.view addSubview:self.titleTextField];
    self.titleTextField.font = [UIFont systemFontOfSize:13];
    self.titleTextField.placeholder = @"请填写标题";
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self.baseToolboxView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth-10-150, 50));
    }];
    
    UIImageView *videoImageView = [[UIImageView alloc]init];
    videoImageView.image = self.videoImage;
  //  videoImageView.image = [UIImage imageNamed:@"jay"];
    [self.view addSubview:videoImageView];
    
    [videoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTextField.mas_top);
        make.left.equalTo(self.titleTextField.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(140, 200));
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kWindowWidth, 50));
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
    }];
    
    [btn setTitle:@"确认发布" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn addTarget:self action:@selector(uploadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setupPlayerUI {
    
    UIFont *font = [UIFont systemFontOfSize:18];
    if (@available(iOS 9.0, *)) {
        font = [UIFont monospacedDigitSystemFontOfSize:18 weight:(UIFontWeightRegular)];
    }
    self.currentTime = [[UILabel alloc] initWithFrame:CGRectMake(20, kWindowWidth - 130, 130, 30)];
    self.currentTime.text = @"0.00s";
    self.currentTime.textColor = [UIColor blueColor];
    self.currentTime.font = font;
    [self.view addSubview:self.currentTime];
    
    self.duration = [[UILabel alloc] initWithFrame:CGRectMake(kWindowWidth - 80, kWindowHeight - 130, 130, 30)];
    self.duration.text = [NSString stringWithFormat:@"%.2f", CMTimeGetSeconds(self.player.currentItem.duration)];
    self.duration.textColor = [UIColor blueColor];
    self.duration.font = font;
    [self.view addSubview:self.duration];
    
    self.playSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, kWindowHeight - 100, kWindowWidth - 40, 30)];
    self.playSlider.minimumValue = 0;
    self.playSlider.maximumValue = 1;
    [self.playSlider addTarget:self action:@selector(playSeekTo:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.playSlider];
    
}

#pragma mark -- 播放器初始化
- (void)initPlayer {
    if (!self.url) {
        return;
    }
    self.player = [[AVPlayer alloc] initWithURL:self.url];
    self.playerView = [[PlayerView alloc] initWithFrame:CGRectMake(0, 64, kWindowWidth, kWindowHeight-64)];
    self.playerView.player = self.player;
    [self.view addSubview:self.playerView];
}

#pragma mark -- 视频上传准备
- (void)setupFileUpload {
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    self.progressView.progress = 0.0;
    self.progressView.hidden = YES;
    self.progressView.trackTintColor = [UIColor blackColor];
    self.progressView.progressTintColor = [UIColor orangeColor];
    self.progressView.center = self.view.center;
    [self.view addSubview:self.progressView];
    
    [self prepareUpload];
}

- (void)prepareUpload {
    self.progressView.hidden = YES;
    self.progressView.progress = 0;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    
    int x = arc4random() % 1000;
  
    NSString *videoName = [NSString stringWithFormat:@"%@%d",[formatter stringFromDate:[NSDate date]],x];

    NSString *key;
    if (self.actionType == PLSActionTypePlayer) {
        key = [NSString stringWithFormat:@"short_video_%@.mp4", videoName];
    }
    
    if (self.actionType == PLSActionTypeGif) {
        key = [NSString stringWithFormat:@"short_video_%@.gif", [formatter stringFromDate:[NSDate date]]];
    }
    
    [QiniuTokenNetworking postQiniuTokenNetworkingCompletion:^(NSDictionary * _Nonnull dic, NSError * _Nonnull error) {
         self.QiniuUrl = [dic objectForKey:@"url"];
         self.QiniuToken = [dic objectForKey:@"token"];
        
        PLSUploaderConfiguration * uploadConfig = [[PLSUploaderConfiguration alloc] initWithToken:self.QiniuToken  videoKey:key https:YES recorder:nil];
        self.shortVideoUploader = [[PLShortVideoUploader alloc] initWithConfiguration:uploadConfig];
        self.shortVideoUploader.delegate = self;
    }];
}

#pragma mark -- 按钮的响应事件
#pragma mark -- 返回
- (void)backButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
   // [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- 播放
- (void)handleSingleFingerToPlayVideoEvent:(id)sender {
    if (1.0 == [self.player rate]) {
        [self.player pause];
    } else {
        [self.player play];
    }
}

#pragma mark -- 本地视频上传到云端
- (void)uploadButtonClick:(id)sender {
    [self showProgress];
    NSString *filePath = _url.path;
    
    self.uploadButton.selected = !self.uploadButton.selected;
    
    if (self.uploadButton.isSelected) {
        self.progressView.hidden = NO;
        [self.shortVideoUploader uploadVideoFile:filePath];
    }else {
        [self.shortVideoUploader cancelUploadVidoFile];
    }
}

#pragma mark -- seekTo
- (void)playSeekTo:(id)sender {
    UISlider * slider = (UISlider *)sender;
    slider.enabled = NO;
    CMTime time = CMTimeMake(slider.value * CMTimeGetSeconds(self.player.currentItem.duration), 1);
    self.currentTime.text = [NSString stringWithFormat:@"%.2fs", CMTimeGetSeconds(time)];
    __weak typeof(self) weakSelf = self;
    [self.player seekToTime:time completionHandler:^(BOOL finished) {
        weakSelf.playSlider.enabled = YES;
    }];
}

#pragma mark -- 提示框
- (void)showAlertWithMessage:(NSString *)message {
    NSLog(@"alert message: %@", message);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    alert.delegate = self;
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    SuccessVideoViewController *vc = [[SuccessVideoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - PLShortVideoUploaderDelegate 视频上传
- (void)shortVideoUploader:(PLShortVideoUploader *)uploader completeInfo:(PLSUploaderResponseInfo *)info uploadKey:(NSString *)uploadKey resp:(NSDictionary *)resp {
    
    self.uploadButton.selected = NO;
    if(info.error){
        [self showAlertWithMessage:[NSString stringWithFormat:@"上传失败，error: %@", info.error]];
        return ;
    }
    
    self.urlString = [NSString stringWithFormat:@"%@/%@", self.QiniuUrl, uploadKey];
    
    NSString *title = self.titleTextField.text;
    if (title.length <1) {
        title = @"暂未填写标题";
    }
    
    [UploadVideoNetworking postUploadVideoWithToken:kUser.user_token withVideoUrl:self.urlString withTitle:title complection:^(NSString * _Nonnull msg, NSError * _Nonnull error) {
        
        [self showAlertWithMessage:@"上传成功"];
       
    }];
    
  
}

- (void)shortVideoUploader:(PLShortVideoUploader *)uploader uploadKey:(NSString *)uploadKey uploadPercent:(float)uploadPercent {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = uploadPercent;
    });
    NSLog(@"uploadKey: %@",uploadKey);
    NSLog(@"uploadPercent: %.2f",uploadPercent);
}

#pragma mark -- 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    self.player = nil;
    
  //  self.gifView = nil;
    
    self.shortVideoUploader = nil;
    
    self.baseToolboxView = nil;
    
    NSLog(@"dealloc: %@", [[self class] description]);
}

#pragma mark -- 手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UISlider class]])
    {
        return NO;
    }
    return YES;
}

@end

//
//  EditViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "EditViewController.h"
#import "UploadViewController.h"
@interface EditViewController ()<PLShortVideoEditorDelegate,PLSAVAssetExportSessionDelegate>
// 视频的分辨率，设置之后影响编辑时的预览分辨率、导出的视频的的分辨率
@property (assign, nonatomic) CGSize videoSize;
// 编辑
@property (strong, nonatomic) PLShortVideoEditor *shortVideoEditor;
// 编辑信息
@property (strong, nonatomic) NSMutableDictionary *outputSettings;

// 视频文件信息
@property (strong, nonatomic) NSMutableDictionary *movieSettings;
@property (strong, nonatomic) UIView *baseToolboxView;
@property (strong, nonatomic) UIView *editDisplayView;
// 播放/暂停按钮，点击视频预览区域实现播放/暂停功能
@property (strong, nonatomic) UIButton *playButton;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.outputSettings = [[NSMutableDictionary alloc] init];
    // 用来演示如何获取视频的分辨率 videoSize
    NSDictionary *movieSettings = self.settings[PLSMovieSettingsKey];
    AVAsset *movieAsset = movieSettings[PLSAssetKey];
    if (!movieAsset) {
        NSURL *movieURL = movieSettings[PLSURLKey];
        movieAsset = [AVAsset assetWithURL:movieURL];
    }
    self.videoSize = movieAsset.pls_videoSize;
    [self setupShortVideoEditor];
    
    [self setupBaseToolboxView];
    [self setupEditDisplayView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self observerUIApplicationStatusForShortVideoEditor];
    
    [self.shortVideoEditor startEditing];
    self.playButton.selected = NO;
}

#pragma mark - 程序的状态监听
- (void)observerUIApplicationStatusForShortVideoEditor {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shortVideoEditorWillResignActiveEvent:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shortVideoEditorDidBecomeActiveEvent:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)removeObserverUIApplicationStatusForShortVideoEditor {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)shortVideoEditorWillResignActiveEvent:(id)sender {
    NSLog(@"[self.shortVideoEditor UIApplicationWillResignActiveNotification]");
    [self.shortVideoEditor stopEditing];
    self.playButton.selected = YES;
}

- (void)shortVideoEditorDidBecomeActiveEvent:(id)sender {
    NSLog(@"[self.shortVideoEditor UIApplicationDidBecomeActiveNotification]");
    [self.shortVideoEditor startEditing];
    self.playButton.selected = NO;
}
- (void)setupShortVideoEditor
{
    //init
    self.movieSettings = [[NSMutableDictionary alloc] init];
    self.outputSettings = [[NSMutableDictionary alloc] init];
    self.outputSettings[PLSMovieSettingsKey] = self.movieSettings;
    // 原始视频
    [self.movieSettings addEntriesFromDictionary:self.settings[PLSMovieSettingsKey]];
    self.movieSettings[PLSVolumeKey] = [NSNumber numberWithFloat:1.0];
    
    // 视频编辑类
    AVAsset *asset = self.movieSettings[PLSAssetKey];
    
    if (self.playerItem) {
        self.shortVideoEditor = [[PLShortVideoEditor alloc] initWithPlayerItem:self.playerItem videoSize:CGSizeZero];
    } else {
        self.shortVideoEditor = [[PLShortVideoEditor alloc] initWithAsset:asset videoSize:CGSizeZero];
    }
    
    self.shortVideoEditor.delegate = self;
    self.shortVideoEditor.loopEnabled = YES;
}

- (void)setupBaseToolboxView {
    self.view.backgroundColor = [UIColor blackColor];
    
    self.baseToolboxView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowWidth, 64)];
    self.baseToolboxView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.baseToolboxView];
    
    // 关闭按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"btn_bar_back_a"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"btn_bar_back_b"] forState:UIControlStateHighlighted];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    backButton.frame = CGRectMake(0, 0, 80, 64);
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 7, 0, 0);
    backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.baseToolboxView addSubview:backButton];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 64)];
//    if (iPhoneX_SERIES) {
//        titleLabel.center = CGPointMake(PLS_SCREEN_WIDTH / 2, 48);
//    } else {
//        titleLabel.center = CGPointMake(PLS_SCREEN_WIDTH / 2, 32);
//    }
    titleLabel.center = CGPointMake(kWindowWidth / 2, 48);
    titleLabel.text = @"编辑视频";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    [self.baseToolboxView addSubview:titleLabel];
    
    // 下一步
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setImage:[UIImage imageNamed:@"btn_bar_next_a"] forState:UIControlStateNormal];
    [nextButton setImage:[UIImage imageNamed:@"btn_bar_next_b"] forState:UIControlStateHighlighted];
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    nextButton.frame = CGRectMake(kWindowWidth - 80, 0, 80, 64);
    nextButton.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    nextButton.imageEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    nextButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [nextButton addTarget:self action:@selector(nextButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.baseToolboxView addSubview:nextButton];
}

#pragma mark - 返回
- (void)backButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 下一步
- (void)nextButtonClick
{
    
    [self.shortVideoEditor stopEditing];
    self.playButton.selected = YES;
    [self showProgress];
    AVAsset *asset = self.movieSettings[PLSAssetKey];
    PLSAVAssetExportSession *exportSession = [[PLSAVAssetExportSession alloc] initWithAsset:asset];
    exportSession.outputFileType = PLSFileTypeMPEG4;
    exportSession.shouldOptimizeForNetworkUse = YES;
    exportSession.outputSettings = self.outputSettings;
    exportSession.delegate = self;
    exportSession.isExportMovieToPhotosAlbum = YES;
    exportSession.audioChannel = 2;
    exportSession.audioBitrate = PLSAudioBitRate_128Kbps;
    exportSession.outputVideoFrameRate = MIN(60, asset.pls_normalFrameRate);
    // 设置视频的导出分辨率，会将原视频缩放
    exportSession.outputVideoSize = self.videoSize;

    __weak typeof(self) weakSelf = self;
    [exportSession setCompletionBlock:^(NSURL *url) {
        NSLog(@"Asset Export Completed");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf joinNextViewController:url];
        });
    }];
    
    [exportSession setFailureBlock:^(NSError *error) {
        NSLog(@"Asset Export Failed: %@", error);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //[weakSelf removeActivityIndicatorView];
          //  AlertViewShow(error);
             [self hideProgress];
            [self showError:error];
           
        });
    }];
    
    [exportSession setProcessingBlock:^(float progress) {
        // 更新进度 UI
        NSLog(@"Asset Export Progress: %f", progress);
        dispatch_async(dispatch_get_main_queue(), ^{
           // weakSelf.progressLabel.text = [NSString stringWithFormat:@"%d%%", (int)(progress * 100)];
        });
    }];
    
    [exportSession exportAsynchronously];
}

#pragma mark - 完成视频合成跳转到下一页面
- (void)joinNextViewController:(NSURL *)url {
    [self hideProgress];
    UploadViewController *vc = [[UploadViewController alloc] init];
    vc.url = url;
    [self presentViewController:vc animated:YES completion:nil];
}

//  displayView
- (void)setupEditDisplayView
{
    self.editDisplayView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.baseToolboxView.frame), kWindowWidth, kWindowHeight-CGRectGetHeight(self.baseToolboxView.frame))];
    self.editDisplayView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.editDisplayView];
    
    self.shortVideoEditor.previewView.frame = self.editDisplayView.bounds;
    self.shortVideoEditor.fillMode = PLSVideoFillModePreserveAspectRatio;
    [self.editDisplayView addSubview:self.shortVideoEditor.previewView];
    
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.playButton.frame = self.shortVideoEditor.previewView.frame;
    self.playButton.center = self.shortVideoEditor.previewView.center;
    [self.playButton setImage:[UIImage imageNamed:@"ss_icon_pause"] forState:UIControlStateSelected];
    [self.editDisplayView addSubview:self.playButton];
    [self.playButton addTarget:self action:@selector(playButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 启动/暂停视频预览
- (void)playButtonClicked:(UIButton *)button {
    if (self.shortVideoEditor.isEditing) {
        [self.shortVideoEditor stopEditing];
        self.playButton.selected = YES;
    } else {
        [self.shortVideoEditor startEditing];
        self.playButton.selected = NO;
    }
}

#pragma mark - PLShortVideoEditorDelegate
- (void)shortVideoEditor:(PLShortVideoEditor *)editor didReadyToPlayForAsset:(AVAsset *)asset timeRange:(CMTimeRange)timeRange {
    //NSLog(@"%s, line:%d", __FUNCTION__, __LINE__);
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.playButton.selected = NO;
//    });
}



@end

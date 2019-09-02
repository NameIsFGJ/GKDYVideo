//
//  AddVideoViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/27.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddVideoViewController.h"
#import "MusicsViewController.h"
#import "VideoProgressBar.h"
#import "VideoDeleteButton.h"
#import "EditViewController.h"
@interface AddVideoViewController ()<PLShortVideoRecorderDelegate>
@property (strong, nonatomic) PLShortVideoRecorder *shortVideoRecorder;
@property (strong, nonatomic) VideoProgressBar *progressBar;
@property (strong,nonatomic) UIButton *recordButton;
@property (strong, nonatomic) UILabel *durationLabel;
@property (strong, nonatomic) VideoDeleteButton *deleteButton;
@property (strong, nonatomic) UIButton *endButton;
@property (strong, nonatomic) UIView *speedView;
@property (strong, nonatomic) UIButton *musicButton;

@end

@implementation AddVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configVideo];
    
    [self creatLeftView];
    
    [self creatRecordButton];
}

- (void)configVideo
{
    PLSVideoConfiguration *videoConfiguration = [PLSVideoConfiguration defaultConfiguration];
    PLSAudioConfiguration *audioConfiguration = [PLSAudioConfiguration defaultConfiguration];
    
    self.shortVideoRecorder = [[PLShortVideoRecorder alloc]initWithVideoConfiguration:videoConfiguration audioConfiguration:audioConfiguration];
    self.shortVideoRecorder.delegate = self;
    [self.view addSubview:self.shortVideoRecorder.previewView];
    
    // 采集
    [self.shortVideoRecorder startCaptureSession];
    
    // 单位为秒
    self.shortVideoRecorder.maxDuration = 15;
    self.shortVideoRecorder.minDuration = 3.0f;
    
    // 默认为 NO，不启用自动确定
    self.shortVideoRecorder.adaptationRecording = YES;
    
    // 默认YES 从后台进入前台自动开始录制
    self.shortVideoRecorder.backgroundMonitorEnable = YES;
    
    // 倍速
    self.shortVideoRecorder.recoderRate = PLSVideoRecoderRateNormal;
    
    //开始拍摄
    // [self.shortVideoRecorder startRecording];
}

- (void)creatLeftView
{
    // 返回
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 10, 35, 35);
    [backButton setBackgroundImage:[UIImage imageNamed:@"btn_camera_cancel_a"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"btn_camera_cancel_b"] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // 切换摄像头
    UIButton *toggleCameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    toggleCameraButton.frame = CGRectMake(10, 280, 35, 35);
    [toggleCameraButton setBackgroundImage:[UIImage imageNamed:@"toggle_camera"] forState:UIControlStateNormal];
    [toggleCameraButton addTarget:self action:@selector(toggleCameraButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toggleCameraButton];
    
    // 美颜
    UIButton *beautyFaceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    beautyFaceButton.frame = CGRectMake(10, 235, 30, 30);
    [beautyFaceButton setTitle:@"美颜" forState:UIControlStateNormal];
    [beautyFaceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    beautyFaceButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [beautyFaceButton addTarget:self action:@selector(beautyFaceButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beautyFaceButton];
    beautyFaceButton.selected = YES;
    
    // 速度
    UIButton *speedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    speedButton.frame = CGRectMake(10, 325, 30, 30);
    [speedButton setTitle:@"速度" forState:UIControlStateNormal];
    [speedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    speedButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [speedButton addTarget:self action:@selector(speedButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:speedButton];
    
    self.speedView = [[UIView alloc]initWithFrame:CGRectMake(50, 325, 200, 30)];
    [self.view addSubview:self.speedView];
    self.speedView.backgroundColor = [UIColor redColor];
    self.speedView.hidden = YES;
    
    
    // 是否使用背景音乐
    self.musicButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 190, 35, 35)];
    self.musicButton.layer.cornerRadius = 23;
    [self.musicButton setTitle:@"音乐" forState:UIControlStateNormal];
    self.musicButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.musicButton.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6);
    [self.musicButton addTarget:self action:@selector(musicButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.musicButton];
    
}

// 返回方法
- (void)backButtonEvent:(id)button
{
    [self discardRecord];
}

//
- (void)musicButtonOnClick:(id)button
{
    
    MusicsViewController *vc = [[MusicsViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    //self.musicButton.selected = !self.musicButton.selected;
    //    if (self.musicButton.selected) {
    //        // 背景音乐
    //        NSURL *audioURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Greenery" ofType:@"m4a"]];
    //        [self.shortVideoRecorder mixAudio:audioURL];
    //    } else{
    //        [self.shortVideoRecorder mixAudio:nil];
    //    }
}


// 取消录制
- (void)discardRecord {
    [self.shortVideoRecorder cancelRecording];
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 切换前后置摄像头
- (void)toggleCameraButtonEvent:(UIButton *)sender {
    
    [self.shortVideoRecorder toggleCamera];
    // 采集帧率不大于 30 帧的时候，使用 [self.shortVideoRecorder toggleCamera] 和 [self.shortVideoRecorder toggleCamera:block] 都可以。当采集大于 30 帧的时候，为确保切换成功，需要先停止采集，再切换相机，切换完成再启动采集。如果不先停止采集，部分机型上采集 60 帧的时候，切换摄像头可能会耗时几秒钟
    //    if (self.videoConfiguration.videoFrameRate > 30) {
    //        sender.enabled = NO;
    //        __weak typeof(self) weakself = self;
    //        [self.shortVideoRecorder stopCaptureSession];
    //        [self.shortVideoRecorder toggleCamera:^(BOOL isFinish) {
    //          //  [weakself checkActiveFormat];// 默认的 active 可能最大只支持采集 30 帧，这里手动设置一下
    //            [weakself.shortVideoRecorder startCaptureSession];
    //            dispatch_async(dispatch_get_main_queue(), ^{
    //                sender.enabled = YES;
    //            });
    //        }];
    //    } else {
    //        [self.shortVideoRecorder toggleCamera];
    //    }
    
}

// 打开／关闭美颜
- (void)beautyFaceButtonEvent:(id)sender {
    UIButton *button = (UIButton *)sender;
    
    [self.shortVideoRecorder setBeautifyModeOn:!button.selected];
    
    button.selected = !button.selected;
}

- (void)speedButtonEvent:(id)sender
{
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    self.speedView.hidden = !button.selected;
}


- (void)creatRecordButton
{
    // 录制视频的操作按钮
    CGFloat buttonWidth = 80.0f;
    self.recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.recordButton.frame = CGRectMake(0, 0, buttonWidth, buttonWidth);
    self.recordButton.center = CGPointMake(kWindowWidth / 2, kWindowHeight-120);
    [self.recordButton setImage:[UIImage imageNamed:@"btn_record_a"] forState:UIControlStateNormal];
    [self.recordButton addTarget:self action:@selector(recordButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.recordButton];
    
    //录制进度条
    self.progressBar = [[VideoProgressBar alloc]initWithFrame:CGRectMake(0,kWindowHeight-30 , kWindowWidth, 10)];
    [self.view addSubview:self.progressBar];
    
    // 录制时间
    self.durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWindowWidth - 150, kWindowHeight-200, 130, 40)];
    self.durationLabel.textColor = [UIColor whiteColor];
    self.durationLabel.text = [NSString stringWithFormat:@"%.2fs", self.shortVideoRecorder.getTotalDuration];
    self.durationLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.durationLabel];
    
    // 删除视频片段的按钮
    // CGPoint center = self.recordButton.center;
    //center.x = 40;
    self.deleteButton = [VideoDeleteButton getInstance];
    self.deleteButton.style = PLSDeleteButtonStyleNormal;
    self.deleteButton.frame = CGRectMake(CGRectGetMinX(self.recordButton.frame)-80, CGRectGetMinY(self.recordButton.frame), 50, 50);
    // self.deleteButton.center = center;
    [self.deleteButton setImage:[UIImage imageNamed:@"btn_del_a"] forState:UIControlStateNormal];
    [self.deleteButton addTarget:self action:@selector(deleteButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.deleteButton];
     self.deleteButton.hidden = YES;
    
    // 结束录制的按钮
    self.endButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.endButton.frame = CGRectMake(CGRectGetMaxX(self.recordButton.frame)+30, CGRectGetMinY(self.recordButton.frame), 50, 50);
    // self.endButton.center = center;
    [self.endButton setBackgroundImage:[UIImage imageNamed:@"end_normal"] forState:UIControlStateNormal];
    [self.endButton setBackgroundImage:[UIImage imageNamed:@"end_disable"] forState:UIControlStateDisabled];
    [self.endButton addTarget:self action:@selector(endButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.endButton];
    self.endButton.enabled = NO;
    self.endButton.hidden = YES;
}

// 录制视频
- (void)recordButtonEvent:(id)sender {
    
    if (self.shortVideoRecorder.isRecording) {
        [self.shortVideoRecorder stopRecording];
    }else{
        [self.shortVideoRecorder startRecording];
    }
    
    
    
    //  [self.shortVideoRecorder startRecording];
    //    if (self.shortVideoRecorder.isRecording) {
    //        [self.shortVideoRecorder stopRecording];
    //
    //
    //    } else {
    //         [self.shortVideoRecorder startRecording];
    ////        if (self.useSDKInternalPath) {
    ////            // 方式1
    ////            // 录制的视频的存放地址由 SDK 内部自动生成
    ////            [self.shortVideoRecorder startRecording];
    ////        } else {
    ////            // 方式2
    ////            // fileURL 录制的视频的存放地址，该参数可以在外部设置，录制的视频会保存到该位置
    ////            [self.shortVideoRecorder startRecording:[self getFileURL]];
    //      //  }
    //    }
    
}

// 删除上一段视频
- (void)deleteButtonEvent:(id)sender {
    if (_deleteButton.style == PLSDeleteButtonStyleNormal) {
        
        [_progressBar setLastProgressToStyle:PLSProgressBarProgressStyleDelete];
        _deleteButton.style = PLSDeleteButtonStyleDelete;
        
    } else if (_deleteButton.style == PLSDeleteButtonStyleDelete) {
        [self.shortVideoRecorder deleteLastFile];
        
        [_progressBar deleteLastProgress];
        
        _deleteButton.style = PLSDeleteButtonStyleNormal;
    }
}

// 结束录制
- (void)endButtonEvent:(id)sender {
    NSLog(@"结束录制");
    AVAsset *asset = self.shortVideoRecorder.assetRepresentingAllFiles;
    [self playEvent:asset];
    // [self.viewRecorderManager cancelRecording];
    // [self.screenRecorderManager cancelRecording];
    // self.viewRecordButton.selected = NO;
}
#pragma mark -- PLShortVideoRecorderDelegate 摄像头／麦克风鉴权的回调
- (void)shortVideoRecorder:(PLShortVideoRecorder *__nonnull)recorder didGetCameraAuthorizationStatus:(PLSAuthorizationStatus)status {
    if (status == PLSAuthorizationStatusAuthorized) {
        [recorder startCaptureSession];
    }
    else if (status == PLSAuthorizationStatusDenied) {
        NSLog(@"Error: user denies access to camera");
    }
}

- (void)shortVideoRecorder:(PLShortVideoRecorder *__nonnull)recorder didGetMicrophoneAuthorizationStatus:(PLSAuthorizationStatus)status {
    if (status == PLSAuthorizationStatusAuthorized) {
        [recorder startCaptureSession];
    }
    else if (status == PLSAuthorizationStatusDenied) {
        NSLog(@"Error: user denies access to microphone");
    }
}

// 开始录制一段视频时
- (void)shortVideoRecorder:(PLShortVideoRecorder *)recorder didStartRecordingToOutputFileAtURL:(NSURL *)fileURL {
    NSLog(@"start recording fileURL: %@", fileURL);
    
    [self.progressBar addProgressView];
    [_progressBar startShining];
}

// 正在录制的过程中
- (void)shortVideoRecorder:(PLShortVideoRecorder *)recorder didRecordingToOutputFileAtURL:(NSURL *)fileURL fileDuration:(CGFloat)fileDuration totalDuration:(CGFloat)totalDuration {
    [_progressBar setLastProgressToWidth:fileDuration / self.shortVideoRecorder.maxDuration * _progressBar.frame.size.width];
    
    self.endButton.enabled = (totalDuration >= self.shortVideoRecorder.minDuration);
    self.durationLabel.text = [NSString stringWithFormat:@"%.2fs", totalDuration];
    self.endButton.hidden = YES;
    self.deleteButton.hidden = YES;
}

// 删除了某一段视频
- (void)shortVideoRecorder:(PLShortVideoRecorder *)recorder didDeleteFileAtURL:(NSURL *)fileURL fileDuration:(CGFloat)fileDuration totalDuration:(CGFloat)totalDuration {
    NSLog(@"delete fileURL: %@, fileDuration: %f, totalDuration: %f", fileURL, fileDuration, totalDuration);
    
    self.endButton.enabled = totalDuration >= self.shortVideoRecorder.minDuration;
    
    if (totalDuration <= 0.0000001f) {
        self.endButton.hidden = YES;
        self.deleteButton.hidden = YES;
    }
    self.durationLabel.text = [NSString stringWithFormat:@"%.2fs", totalDuration];
}

// 完成一段视频的录制时
- (void)shortVideoRecorder:(PLShortVideoRecorder *)recorder didFinishRecordingToOutputFileAtURL:(NSURL *)fileURL fileDuration:(CGFloat)fileDuration totalDuration:(CGFloat)totalDuration {
    NSLog(@"finish recording fileURL: %@, fileDuration: %f, totalDuration: %f", fileURL, fileDuration, totalDuration);
    
    [_progressBar stopShining];
    
    self.deleteButton.hidden = NO;
    self.endButton.hidden = NO;
    
    //  AVAsset *asset = [AVAsset assetWithURL:_URL];
    //  CGFloat duration = CMTimeGetSeconds(asset.duration);
    //self.draftButton.hidden = (totalDuration +  duration) >= self.shortVideoRecorder.maxDuration;
    
    if (totalDuration >= self.shortVideoRecorder.maxDuration) {
        [self endButtonEvent:nil];
    }
}

#pragma mark -- 下一步
- (void)playEvent:(AVAsset *)asset {
    // 获取当前会话的所有的视频段文件
    NSArray *filesURLArray = [self.shortVideoRecorder getAllFilesURL];
    NSLog(@"filesURLArray:%@", filesURLArray);
    
    __block AVAsset *movieAsset = asset;
        if (self.musicButton.selected) {
            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [self showProgress];
           // [self loadActivityIndicatorView];
            // MusicVolume：1.0，videoVolume:0.0 即完全丢弃掉拍摄时的所有声音，只保留背景音乐的声音
            [self.shortVideoRecorder mixWithMusicVolume:1.0 videoVolume:0.0 completionHandler:^(AVMutableComposition * _Nullable composition, AVAudioMix * _Nullable audioMix, NSError * _Nullable error) {
                AVAssetExportSession *exporter = [[AVAssetExportSession alloc]initWithAsset:composition presetName:AVAssetExportPresetHighestQuality];
                NSURL *outputPath = [self exportAudioMixPath];
                exporter.outputURL = outputPath;
                exporter.outputFileType = AVFileTypeMPEG4;
                exporter.shouldOptimizeForNetworkUse= YES;
                exporter.audioMix = audioMix;
                [exporter exportAsynchronouslyWithCompletionHandler:^{
                    switch ([exporter status]) {
                        case AVAssetExportSessionStatusFailed: {
                            NSLog(@"audio mix failed：%@", [[exporter error] description]);
                          //  AlertViewShow([[exporter error] description]);
                        } break;
                        case AVAssetExportSessionStatusCancelled: {
                            NSLog(@"audio mix canceled");
                        } break;
                        case AVAssetExportSessionStatusCompleted: {
                            NSLog(@"audio mix success");
                            movieAsset = [AVAsset assetWithURL:outputPath];
                        } break;
                        default: {
    
                        } break;
                    }
                    dispatch_semaphore_signal(semaphore);
                }];
            }];
           // [self removeActivityIndicatorView];
            [self hideProgress];
            
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        }
    
    // 设置音视频、水印等编辑信息
    NSMutableDictionary *outputSettings = [[NSMutableDictionary alloc] init];
    // 待编辑的原始视频素材
    NSMutableDictionary *plsMovieSettings = [[NSMutableDictionary alloc] init];
    plsMovieSettings[PLSAssetKey] = movieAsset;
    plsMovieSettings[PLSStartTimeKey] = [NSNumber numberWithFloat:0.f];
    plsMovieSettings[PLSDurationKey] = [NSNumber numberWithFloat:[self.shortVideoRecorder getTotalDuration]];
    plsMovieSettings[PLSVolumeKey] = [NSNumber numberWithFloat:1.0f];
    outputSettings[PLSMovieSettingsKey] = plsMovieSettings;
    
    EditViewController *videoEditViewController = [[EditViewController alloc] init];
    videoEditViewController.settings = outputSettings;
    videoEditViewController.filesURLArray = filesURLArray;
   [self presentViewController:videoEditViewController animated:YES completion:nil];
    
}

#pragma mark - 输出路径
- (NSURL *)exportAudioMixPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path]) {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *nowTimeStr = [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:0]];
    NSString *fileName = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_mix.mp4",nowTimeStr]];
    return [NSURL fileURLWithPath:fileName];
}
@end

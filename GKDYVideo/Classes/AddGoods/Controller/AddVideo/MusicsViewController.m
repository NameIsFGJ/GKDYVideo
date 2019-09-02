//
//  MusicsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MusicsViewController.h"
#import "MusicsTableViewCell.h"
#import "MusicModel.h"
#import "MusicNetworking.h"
#import <AVFoundation/AVFoundation.h>

@interface MusicsViewController ()<UITableViewDelegate,UITableViewDataSource,ButtonClickDelegate>
@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (strong, nonatomic)UITableView *tableView;

@property (strong, nonatomic)AVPlayer *avPlayer;
@property (strong, nonatomic)NSString *musicUrl;
@property (strong, nonatomic)AVPlayerLayer *playerLayer;
//@property (assign, nonatomic)NSIndexPath *selectedIndexPath;
@property (assign, nonatomic)NSInteger selectButtonTag;
@end

@implementation MusicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeUI];
    
    [self networking];
    
    [self creatAVPlayer];
}

- (void)makeUI
{
    // 返回
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 10, 35, 35);
    [backButton setBackgroundColor:[UIColor blackColor]];
    [backButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    // [backButton setBackgroundImage:[UIImage imageNamed:@"btn_camera_cancel_a"] forState:UIControlStateNormal];
    // [backButton setBackgroundImage:[UIImage imageNamed:@"btn_camera_cancel_b"] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 50, kWindowWidth, kWindowHeight- 100);
    
}

- (void)networking
{
    [MusicNetworking postMusicNetworking:kUser.user_token complection:^(NSMutableArray * _Nonnull array, NSError * _Nonnull error) {
        self.itemsArray = array;
        [self.tableView reloadData];
    }];
}

- (void)creatAVPlayer
{
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.playerLayer.frame = CGRectMake(0, 500, 375, 100);
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    self.avPlayer.volume = 3.0f;
    
    [self.view.layer addSublayer:self.playerLayer];
}

- (AVPlayerItem *)AddMusicName:(NSURL *)playerUrl
{
    AVAsset *musicAsset = [AVURLAsset URLAssetWithURL:playerUrl options:nil];
    AVPlayerItem *playItem = [AVPlayerItem playerItemWithAsset:musicAsset];
    return playItem;
}

- (void)backButtonEvent:(id)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.avPlayer pause];
    [self.playerLayer removeFromSuperlayer];
    self.playerLayer = nil;
    self.avPlayer = nil;
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    return self.itemsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"MusicsTableViewCellID";
    MusicsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.itemsArray[indexPath.row];
    cell.pauseButton.tag = 100+indexPath.row;
    cell.useButton.tag = 200+indexPath.row;
    cell.delegate = self;
    cell.tag = 300+indexPath.row;
    
    if (self.selectButtonTag == indexPath.row +300) {
        if (cell.pauseButton.isSelected) {
            NSLog(@"pauseButton 选中状态");
        }else{
             NSLog(@"pauseButton 不选中状态");
        }
       
    }else{
        cell.pauseButton.selected = NO;
       // [cell.pauseButton setImage:[UIImage imageNamed:@"bofang"] forState:UIControlStateNormal];
    }
    
    NSLog(@"cell.tag  =%ld",cell.tag);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark MusicsTableViewCellDelegate
- (void)pauseButtonAction:(MusicsTableViewCell *_Nullable)cell;
{
    if (!cell.pauseButton.selected)
    {
        if (cell.pauseButton.tag == 100)
        {
            NSURL *playURL =[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Greenery" ofType:@"m4a"]];
            
            AVPlayerItem *playItem = [self AddMusicName:playURL];
            
            self.avPlayer = [AVPlayer playerWithPlayerItem:playItem];
            
            [self.avPlayer play];
        }else if (cell.pauseButton.tag == 101){
            
            NSURL *playURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"If_I_Had_a_Chicken" ofType:@"m4a"]];
            
            AVPlayerItem *playItem = [self AddMusicName:playURL];
            
            self.avPlayer = [AVPlayer playerWithPlayerItem:playItem];
            
            [self.avPlayer play];
        }else if (cell.pauseButton.tag == 102){
            
            NSURL *playURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"天使简约音效" ofType:@"m4r"]];
            
            AVPlayerItem *playItem = [self AddMusicName:playURL];
            
            self.avPlayer = [AVPlayer playerWithPlayerItem:playItem];
            
            [self.avPlayer play];
       
        }else if (cell.pauseButton.tag == 103){
            
            NSURL *playURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"胜利小旋律音效" ofType:@"m4r"]];
            
            AVPlayerItem *playItem = [self AddMusicName:playURL];
            
            self.avPlayer = [AVPlayer playerWithPlayerItem:playItem];
            
            [self.avPlayer play];
        }
    }else{
        [self.avPlayer pause];
    }
    
    if (self.selectButtonTag) {
        [cell.pauseButton setImage:[UIImage imageNamed:@"zanting"] forState:UIControlStateNormal];
    }
    
    [cell.pauseButton setImage:[UIImage imageNamed:@"bofang"] forState:UIControlStateNormal];
    self.selectButtonTag = cell.tag;
    [self.tableView reloadData];
}

#pragma mark 懒加载
- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"MusicsTableViewCell" bundle:nil] forCellReuseIdentifier:@"MusicsTableViewCellID"];
    }
    return _tableView;
}

@end

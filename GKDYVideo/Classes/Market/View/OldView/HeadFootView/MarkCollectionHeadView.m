//
//  MarkCollectionHeadView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarkCollectionHeadView.h"
#import "MarketModel.h"
#import <UIButton+WebCache.h>
#import "MarketSearchViewController.h"
#import "MarketMessageViewController.h"
#import "MarketUserShopViewController.h"
@interface MarkCollectionHeadView()<SDCycleScrollViewDelegate>

@property (strong, nonatomic)UIView *bannerView;
@property (strong, nonatomic)UIButton *searchButton;
@property (strong, nonatomic)UIButton *messageButton;
@property (strong, nonatomic)UIView *buttonView;
@property (strong, nonatomic)UIView *sectionView;
@property (strong, nonatomic)UIButton *btn0;
@property (strong, nonatomic)UIButton *btn1;
@property (strong, nonatomic)UIButton *btn2;
@property (strong, nonatomic)UIButton *btn3;
@property (strong, nonatomic)UIButton *btn4;
@property (strong, nonatomic)UIButton *btn5;
@property (strong, nonatomic)UIButton *btn6;
@property (strong, nonatomic)UIButton *btn7;
@end

@implementation MarkCollectionHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeUI];
        [self reloadData];
    }
    return self;
}

- (void)reloadData
{
    
    __block MarkCollectionHeadView *weakSelf = self;
    
    self.getBlock = ^(MarketModel * _Nonnull model) {
      
        NSArray *array = model.ad_list;
        NSMutableArray *itemsArray = [NSMutableArray array];
        for (AdListModel *model in array) {
            NSString *url = [NSString stringWithFormat:@"%@%@",kSERVICE,model.image];
            [itemsArray addObject:url];
        }
        
        weakSelf.scrollView.imageURLStringsGroup = itemsArray;
        
        NSArray *btnArray = [NSArray arrayWithObjects:weakSelf.btn0,weakSelf.btn1,weakSelf.btn2,weakSelf.btn3,weakSelf.btn4,weakSelf.btn5,weakSelf.btn6,weakSelf.btn7, nil];
        // 数据
        NSArray *buttonArray = model.category;
        for (int i = 0; i < btnArray.count; i ++) {
            CategoryModel *model = buttonArray[i];
            UIButton *btn = btnArray[i];
            UIImageView *contentImageView = [[UIImageView alloc]init];
            [btn addSubview:contentImageView];
            [contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_offset(0);
                make.size.mas_equalTo(CGSizeMake(40, 40));
                make.centerX.mas_equalTo(btn.mas_centerX);
            }];
            
            NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,model.image];
            [contentImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
            UILabel *contentLabel = [[UILabel alloc]init];
            [btn addSubview:contentLabel];
            [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.mas_equalTo(0);
                make.height.mas_equalTo(30);
            }];
            
            contentLabel.font = kFontSize(15);
            contentLabel.textColor = [UIColor blackColor];
            contentLabel.text = model.name;
            contentLabel.textAlignment = NSTextAlignmentCenter;
            [btn addTarget:weakSelf action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    };
    
   
}

- (void)makeUI
{
    self.bannerView = [[UIView alloc]init];
    [self addSubview:self.bannerView];
    self.bannerView.backgroundColor = [UIColor redColor];
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(212);
    }];
    
    [self.bannerView addSubview:self.scrollView];
    self.scrollView.frame = self.bannerView.bounds;
    
    [self.bannerView addSubview:self.searchButton];
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bannerView.mas_centerX);
        make.top.mas_equalTo(25);
        make.size.mas_equalTo(CGSizeMake(261, 35));
    }];
    
    [self.bannerView addSubview:self.messageButton];
    [self.messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.searchButton.mas_right).offset(20);
        make.centerY.mas_equalTo(self.searchButton.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    
    
    self.buttonView = [[UIView alloc]init];
    [self addSubview:self.buttonView];
    
    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.bannerView.mas_bottom);
        make.height.mas_equalTo(180);
    }];
    
    self.sectionView = [[UIView alloc]init];
    [self addSubview:self.sectionView];
    [self.sectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.buttonView.mas_bottom).offset(0);
        
    }];
    
    self.sectionView.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < 4; i ++) {

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonView addSubview:button];
        button.tag = 100+i;
        button.titleLabel.font = kFontSize(15);
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.left.mas_equalTo(20 + 90*i);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
    }
    
    for (int i = 0; i < 4; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonView addSubview:button];
        button.tag = 104+i;
        button.titleLabel.font = kFontSize(15);
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10+70+10);
            make.left.mas_equalTo(20 + 90*i);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
    }
    
    _btn0 = [self viewWithTag:100];
    _btn1 = [self viewWithTag:101];
    _btn2 = [self viewWithTag:102];
    _btn3 = [self viewWithTag:103];
    _btn4 = [self viewWithTag:104];
    _btn5 = [self viewWithTag:105];
    _btn6 = [self viewWithTag:106];
    _btn7 = [self viewWithTag:107];
    
    UIView *lineView = [[UIView alloc]init];
    [self.buttonView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(.5);
        make.bottom.mas_equalTo(0);
    }];
    
    lineView.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.sectionView addSubview:titleLabel];
    titleLabel.text = @"热门商品";
    titleLabel.font = kFontSize(18);
    titleLabel.textColor = [UIColor blackColor];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(17);
        make.center.equalTo(self.sectionView);
    }];
    
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sectionleftImage"]];
    [self.sectionView addSubview:leftImageView];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(titleLabel.mas_left).offset(-5);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(68, 5));
    }];
    
    UIImageView *rightImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sectionRightImage"]];
    [self.sectionView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(5);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(68, 5));
    }];
}

- (void)buttonAction:(UIButton *)btn
{
    NSLog(@"按钮点击");
}

- (void)pushSearchVCAction
{
    MarketSearchViewController *vc = [[MarketSearchViewController alloc]init];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)pushMessageVCAction
{
    NSLog(@"pushMessageVCAction");
}

#pragma mark BannerViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    self.block(index);
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index;
{
    
}

- (SDCycleScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"userIcon"]];
        _scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _scrollView.currentPageDotColor = [UIColor whiteColor];
        _scrollView.autoScroll = YES;
        _scrollView.autoScrollTimeInterval = 3;
    }
    return _scrollView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

- (UIButton *)searchButton
{
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchButton setImage:[UIImage imageNamed:@"searchImageView"] forState:UIControlStateNormal];
        _searchButton.layer.cornerRadius = 3;
        _searchButton.layer.masksToBounds = YES;
        [_searchButton addTarget:self
                          action:@selector(pushSearchVCAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchButton;
}

- (UIButton *)messageButton
{
    if (!_messageButton) {
        _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageButton setImage:[UIImage imageNamed:@"liuyan"] forState:UIControlStateNormal];
        [_messageButton addTarget:self
                           action:@selector(pushMessageVCAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageButton;
}
@end

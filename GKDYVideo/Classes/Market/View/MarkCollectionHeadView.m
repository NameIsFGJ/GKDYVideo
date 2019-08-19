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
#import "MarketTestViewController.h"
@interface MarkCollectionHeadView()<SDCycleScrollViewDelegate>

@property (strong, nonatomic)UIView *bannerView;
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
    }
    return self;
}

- (void)reloadData
{
    NSArray *array = self.model.ad_list;
    NSMutableArray *itemsArray = [NSMutableArray array];
    for (AdListModel *model in array) {
        NSString *url = [NSString stringWithFormat:@"%@%@",kSERVICE,model.image];
        [itemsArray addObject:url];
    }
    
    self.scrollView.imageURLStringsGroup = itemsArray;
    
    NSArray *btnArray = [NSArray arrayWithObjects:self.btn0,self.btn1,self.btn2,self.btn3,self.btn4,self.btn5,self.btn6,self.btn7, nil];
    // 数据
    NSArray *buttonArray = self.model.category;
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
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
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
    
    self.buttonView = [[UIView alloc]init];
    [self addSubview:self.buttonView];
    //[self.buttonView setBackgroundColor:[UIColor blueColor]];
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
    
    // 数据
    //NSArray *buttonArray = self.model.category;
    
    for (int i = 0; i < 4; i ++) {
        
       // CategoryModel *model = buttonArray[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonView addSubview:button];
       // [button setTitle:model.name forState:UIControlStateNormal];
     //   [button.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kSERVICE,model.image]]];
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
    MarketTestViewController *vc = [[MarketTestViewController alloc]init];
    [[self viewController].navigationController pushViewController:vc animated:YES];
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

@end

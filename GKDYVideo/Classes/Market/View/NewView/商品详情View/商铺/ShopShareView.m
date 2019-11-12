//
//  ShopShareView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ShopShareView.h"

@implementation ShopShareView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIView *contentView = [[UIView alloc]init];
        [self addSubview:contentView];
        contentView.backgroundColor = [UIColor whiteColor];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(185);
        }];
        
        UIView *view = [[UIView alloc]init];
        [contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
           make.edges.mas_equalTo(UIEdgeInsetsMake(30, 50, 30, 50));
        }];
        
        NSArray *titleArrray = [NSArray arrayWithObjects:@"微信好友",@"朋友圈",@"QQ好友",@"微博", nil];
        NSArray *imageArray = [NSArray arrayWithObjects:@"chat_icon",@"circle_icon",@"qq_ico",@"weibo", nil];
        
        for (int i = 0; i< 4; i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [view addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(48, 72));
                make.left.mas_equalTo(i * 72);
            }];
            btn.tag = 100+i;
            [btn addTarget:self action:@selector(shareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            UIImageView *imageView = [[UIImageView alloc]init];
            [btn addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(48, 48));
            }];
            imageView.image = [UIImage imageNamed:imageArray[i]];
            UILabel *label = [[UILabel alloc]init];
            [btn addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(imageView.mas_bottom).offset(10);
                make.left.mas_equalTo(0);
                make.width.mas_equalTo(48);
            }];
            label.text = titleArrray[i];
            label.font = kFontSize(14);
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.adjustsFontSizeToFitWidth = YES;
        }
        
        UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [contentView addSubview:cancleButton];
        [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(49);
        }];
        [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancleButton setBackgroundColor:kWhiteColor];
       // [cancleButton setBackgroundColor:[UIColor colorWithHex:@"#222934"]];
        [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancleButton addTarget:self action:@selector(missView) forControlEvents:UIControlEventTouchUpInside];
        cancleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        UIView *lineView = [[UIView alloc]init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.equalTo(cancleButton.mas_top).offset(0);
            make.height.mas_equalTo(.5);
        }];
        lineView.backgroundColor = kBgColor;
        
        
        
        UIView *bgView = [[UIView alloc]init];
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(kWindowHeight-185);
            
        }];
        bgView.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(missView)];
        [bgView addGestureRecognizer:tap];
        
        
        
    }
    return self;
}

- (void)shareButtonAction:(UIButton *)sender
{
    NSLog(@"点击");
}

- (void)showView;
{
    [UIView animateWithDuration:5 animations:^{
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(kWindowHeight);
        }];
    }];
}

- (void)missView;
{
    [UIView animateWithDuration:5 animations:^{
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-kWindowHeight);
            make.height.mas_equalTo(kWindowHeight);
        }];
    }];
}
@end

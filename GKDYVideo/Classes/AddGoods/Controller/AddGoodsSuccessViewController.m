//
//  AddGoodsSuccessViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddGoodsSuccessViewController.h"

@implementation AddGoodsSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label1 = [[UILabel alloc]init];
    [self.view addSubview:label1];
    label1.font = kFontSize(24);
    label1.text = @"发布成功";
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, -180));
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    [self.view addSubview:label2];
    label2.text = @"分享到以下平台,让更多人知道";
    label2.font = kFontSize(12);
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(38);
        make.top.equalTo(label1.mas_bottom).offset(50);
    }];
    
    
    NSArray *titleArrray = [NSArray arrayWithObjects:@"微信好友",@"朋友圈",@"QQ好友", nil];
    NSArray *imageArray = [NSArray arrayWithObjects:@"chat_icon",@"circle_icon",@"qq_ico", nil];
    
    for (int i = 0; i< 3; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label2.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(48, 72));
            make.left.mas_equalTo(i * 120+38);
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
        }];
        label.text = titleArrray[i];
        label.font = kFontSize(14);
        label.textColor = [UIColor blackColor];
    }
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:cancleButton];
    [cancleButton setImage:[UIImage imageNamed:@"cancelImage"] forState:UIControlStateNormal];
    // [cancleButton setTitle:@"" forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancleButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
}

- (void)shareButtonAction:(UIButton *)btn
{
    NSLog(@"btn.tag  =%ld",btn.tag);
}

- (void)cancleButtonAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end

//
//  ShareView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        UIView *clearView = [[UIView alloc]init];
        [self addSubview:clearView];
        clearView.backgroundColor = [UIColor clearColor];
        [clearView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.right.mas_equalTo(0);
            make.height.mas_equalTo(kWindowHeight - 185);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(missView)];
        [clearView addGestureRecognizer:tap];
        
        UIView *view1 = [[UIView alloc]init];
        [self addSubview:view1];
        view1.backgroundColor = kMainColor
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(clearView.mas_bottom).offset(0);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(136);
        }];
        
        UIView *contentView = [[UIView alloc]init];
        [view1 addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(30, 50, 30, 50));
        }];
        NSArray *titleArrray = [NSArray arrayWithObjects:@"微信好友",@"朋友圈",@"QQ好友",@"本地保存", nil];
        NSArray *imageArray = [NSArray arrayWithObjects:@"chat_icon",@"circle_icon",@"qq_ico",@"saveNative", nil];

        for (int i = 0; i< 4; i++)
        {
          UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
          [contentView addSubview:btn];
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
            }];
            label.text = titleArrray[i];
            label.font = kFontSize(14);
            label.textColor = kWhiteColor;

        }

        UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:cancleButton];
        [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view1.mas_bottom);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(49);
        }];
        [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancleButton setBackgroundColor:[UIColor colorWithHex:@"#222934"]];
        [cancleButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [cancleButton addTarget:self action:@selector(missView) forControlEvents:UIControlEventTouchUpInside];
        cancleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return self;
}

#pragma mark Action
- (void)shareButtonAction:(UIButton *)btn
{
    NSLog(@"btn.tag ====%ld",btn.tag -100);
    switch (btn.tag) {
        case 100:
            NSLog(@"微信好友");
            break;
        case 101:
            NSLog(@"朋友圈");
            break;
        case 102:
            NSLog(@"QQ好友");
            break;
        case 103:
            NSLog(@"保存本地");
            break;
            
        default:
            break;
    }
}
- (void)showView;
{
    [UIView animateWithDuration:.25f animations:^{
        CGRect frame  = self.frame;
        frame.origin.y = 0;
        self.frame = frame;
    }];
}

- (void)missView;
{
    [UIView animateWithDuration:.25f animations:^{
        CGRect frame  = self.frame;
        frame.origin.y = kWindowHeight;
        self.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end

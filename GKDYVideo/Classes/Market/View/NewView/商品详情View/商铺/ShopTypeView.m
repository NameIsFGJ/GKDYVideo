//
//  ShopTypeView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ShopTypeView.h"

@interface ShopTypeView()
@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
@property (strong, nonatomic) UIButton *button4;
@property (assign, nonatomic) NSInteger buttonTag;
@property (assign, nonatomic) NSInteger buttonIndex;

@end

@implementation ShopTypeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.buttonTag = 101;
        self.buttonIndex = -1;
        
        UIView *lineView = [[UIView alloc]init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(.5);
        }];
        lineView.backgroundColor = kBgColor;
        
        self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.button1];
        [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/4);
            make.bottom.mas_equalTo(0);
            make.top.equalTo(lineView.mas_bottom);
           // make.top.equalTo(lineView.mas_bottom);
            
        }];
        
        self.button1.titleLabel.font = kFontSize(14);
        [self.button1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [self.button1 setTitleColor:kStringColor forState:UIControlStateNormal];
        [self.button1 setTitleColor:kPickColor forState:UIControlStateSelected];
        
        [self.button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        self.button1.tag = 101;
        self.button1.selected = YES;
        
        self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.button2];
        self.button2.titleLabel.font = kFontSize(14);
        [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.button1.mas_top);
            make.width.mas_equalTo(kWindowWidth/4);
            make.left.equalTo(self.button1.mas_right);
            make.bottom.equalTo(self.button1.mas_bottom);
        }];
        self.button2.tag = 102;
        [self.button2 setTitle:@"销量" forState:UIControlStateNormal];
        [self.button2 setTitleColor:kStringColor forState:UIControlStateNormal];
        [self.button2 setTitleColor:kPickColor forState:UIControlStateSelected];
        
        [self.button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.button3];
        self.button3.tag = 103;
        [self.button3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.button1.mas_top);
            make.width.mas_equalTo(kWindowWidth/4);
            make.left.equalTo(self.button2.mas_right);
           make.bottom.equalTo(self.button1.mas_bottom);
        }];
        self.button3.titleLabel.font = kFontSize(14);
        [self.button3 setTitle:@"新品" forState:UIControlStateNormal];
        [self.button3 setTitleColor:kStringColor forState:UIControlStateNormal];
        [self.button3 setTitleColor:kPickColor forState:UIControlStateSelected];
        [self.button3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.button4];
        self.button4.tag = 104;
        [self.button4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.button1.mas_top);
            make.width.mas_equalTo(kWindowWidth/4);
            make.left.equalTo(self.button3.mas_right);
           make.bottom.equalTo(self.button1.mas_bottom);
        }];
        self.button4.titleLabel.font = kFontSize(14);
        [self.button4 setTitle:@"价格" forState:UIControlStateNormal];
        [self.button4 setImage:[UIImage imageNamed:@"downSJX"] forState:UIControlStateNormal];
        [self.button4 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleLeft imageTitleSpace:3];
        [self.button4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.button4 setTitleColor:kStringColor forState:UIControlStateNormal];
        [self.button4 setTitleColor:kPickColor forState:UIControlStateSelected];
        [self.button4 setImage:[UIImage imageNamed:@"upSJX"] forState:UIControlStateSelected];
    }
    return self;
}

- (void)buttonAction:(UIButton *)sender
{
    if (sender.tag !=self.buttonTag)
    {
        UIButton *btn = [self viewWithTag:self.buttonTag];
        btn.selected = NO;
        
        sender.selected = YES;
        self.buttonTag = sender.tag;
    }else
    {
        sender.selected = YES;
    }
    
    if ([self.delegate respondsToSelector:@selector(typeViewWithIndex:)])
    {
        [self.delegate typeViewWithIndex:sender.tag];
    }
}
@end

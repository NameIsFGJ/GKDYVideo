//
//  GoodDetailView4.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GoodDetailView4.h"

@implementation GoodDetailView4

- (instancetype)init
{
    self = [super init];
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button0];
    [button0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 50));
    }];
    [button0 setImage:[UIImage imageNamed:@"shopDetail"] forState:UIControlStateNormal];
    [button0 setTitle:@"店铺" forState:UIControlStateNormal];
    button0.titleLabel.font = kFontSize(11);
    [button0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button0 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleBottom imageTitleSpace:2];
    [button0 addTarget:self action:@selector(button0Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button0.mas_right).offset(0);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 50));
    }];
    [button1 setImage:[UIImage imageNamed:@"shopDetailMessage"] forState:UIControlStateNormal];
    [button1 setTitle:@"客服" forState:UIControlStateNormal];
    button1.titleLabel.font = kFontSize(11);
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleBottom imageTitleSpace:2];
    [button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button1.mas_right).offset(0);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 50));
    }];
    [button2 setImage:[UIImage imageNamed:@"shopDetailCarImage"] forState:UIControlStateNormal];
    [button2 setTitle:@"购物车" forState:UIControlStateNormal];
    button2.titleLabel.font = kFontSize(11);
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleBottom imageTitleSpace:2];
    [button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
    
   // button2.backgroundColor =  kPickColor;
    
    UIView *view1 = [[UIView alloc]init];
    [self addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button2.mas_right);
        
       // make.height.mas_equalTo(50);
        make.right.top.bottom.mas_equalTo(0);
        
    }];
   // view1.backgroundColor = [UIColor blueColor];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view1 addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
    }];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 setTitle:@"加入购物车" forState:UIControlStateNormal];
    button3.titleLabel.font = kFontSize(14);
    button3.backgroundColor = [UIColor colorWithHex:@"#FC8DA7"];
    [button3 addTarget:self action:@selector(button3Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view1 addSubview:button4];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button4 setTitle:@"立即购买" forState:UIControlStateNormal];
    button4.titleLabel.font = kFontSize(14);
    button4.backgroundColor = [UIColor colorWithHex:@"#F8537A"];
    [button4 addTarget:self action:@selector(button4Action) forControlEvents:UIControlEventTouchUpInside];
    
   // button4.backgroundColor = [UIColor redColor];
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
    }];
    NSArray *array = @[button3,button4];
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    
    
    return self;
}

- (void)button0Action
{
    NSLog(@"店铺");
    if ([self.delegate respondsToSelector:@selector(view4WithShopClick:)]) {
        [self.delegate view4WithShopClick:1];
    }
}

- (void)button1Action
{
    NSLog(@"客服");
    if ([self.delegate respondsToSelector:@selector(view4WithService)]) {
        [self.delegate view4WithService];
    }
}

- (void)button2Action
{
    NSLog(@"购物车");
    if ([self.delegate respondsToSelector:@selector(view4WithShopCart)]) {
        [self.delegate view4WithShopCart];
    }
}

- (void)button3Action
{
    NSLog(@"加入购物车");
    if ([self.delegate respondsToSelector:@selector(view4WithAddCartClick:)]) {
        [self.delegate view4WithAddCartClick:1];
    }
}

- (void)button4Action
{
    NSLog(@"立即购买");
    if ([self.delegate respondsToSelector:@selector(view4WithBuyClick:)]) {
        [self.delegate view4WithBuyClick:1];
    }
}

@end

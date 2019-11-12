//
//  LegalListSelectView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/7.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "LegalListSelectView.h"
#import "LegalListSonSelectView.h"

@interface LegalListSelectView ()

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
@property (strong, nonatomic) UIButton *button4;
@property (assign, nonatomic) NSInteger buttonTag;
@property (assign, nonatomic) NSInteger buttonIndex;

// 综合需要用的属性
@property (strong, nonatomic) UIView *buttonView;
@property (strong, nonatomic) UIView *bgView01;
@property (strong, nonatomic) UIView *view0;

@property (assign, nonatomic) NSInteger buttonTag2;
@property (assign, nonatomic) NSInteger buttonIndex2;

@property (strong, nonatomic) NSArray *titleArray;


@end


@implementation LegalListSelectView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.buttonIndex = -1;
        self.buttonTag = 101;
        
        self.buttonIndex2 = -1;
        self.buttonTag2 = -200;
        
        self.titleArray = [NSArray arrayWithObjects:@"综合",@"信用",@"价格降序",@"价格升序", nil];
        
        self.buttonView = [[UIView alloc]init];
        [self addSubview:self.buttonView];
        [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
        self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonView addSubview:self.button1];
        [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/4);
            make.bottom.mas_equalTo(-1);
        }];
        
        self.button1.titleLabel.font = kFontSize(14);
        [self.button1 setTitle:@"综合" forState:UIControlStateNormal];
        [self.button1 setTitleColor:kStringColor forState:UIControlStateNormal];
        [self.button1 setTitleColor:kPickColor forState:UIControlStateSelected];
        [self.button1 setBackgroundColor:[UIColor blueColor]];
        [self.button1 setImage:[UIImage imageNamed:@"downSJX"] forState:UIControlStateNormal];
        [self.button1 setImage:[UIImage imageNamed:@"upSJX"] forState:UIControlStateSelected];
        [self.button1 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleLeft imageTitleSpace:0];
        [self.button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        self.button1.tag = 101;
        self.button1.selected = YES;
        
        self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonView addSubview:self.button2];
        self.button2.titleLabel.font = kFontSize(14);
        [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/4);
            make.left.equalTo(self.button1.mas_right);
             make.bottom.mas_equalTo(-1);
        }];
        self.button2.tag = 102;
        [self.button2 setTitle:@"销量" forState:UIControlStateNormal];
        [self.button2 setTitleColor:kStringColor forState:UIControlStateNormal];
        [self.button2 setTitleColor:kPickColor forState:UIControlStateSelected];
        
        [self.button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonView addSubview:self.button3];
         self.button3.tag = 103;
        [self.button3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/4);
            make.left.equalTo(self.button2.mas_right);
            make.bottom.mas_equalTo(-1);
        }];
        self.button3.titleLabel.font = kFontSize(14);
        [self.button3 setTitle:@"好评" forState:UIControlStateNormal];
        [self.button3 setTitleColor:kStringColor forState:UIControlStateNormal];
        [self.button3 setTitleColor:kPickColor forState:UIControlStateSelected];
        [self.button3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonView addSubview:self.button4];
         self.button4.tag = 104;
        [self.button4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/4);
            make.left.equalTo(self.button3.mas_right);
             make.bottom.mas_equalTo(-1);
        }];
        self.button4.titleLabel.font = kFontSize(14);
        [self.button4 setTitle:@"筛选" forState:UIControlStateNormal];
        [self.button4 setImage:[UIImage imageNamed:@"downSJX"] forState:UIControlStateNormal];
        [self.button4 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleLeft imageTitleSpace:3];
        [self.button4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.button4 setTitleColor:kStringColor forState:UIControlStateNormal];
        [self.button4 setTitleColor:kPickColor forState:UIControlStateSelected];
        [self.button4 setImage:[UIImage imageNamed:@"upSJX"] forState:UIControlStateSelected];
        
        UIView *lineView = [[UIView alloc]init];
        [self.buttonView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(.5);
        }];
        lineView.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
        
        self.view0 = [[UIView alloc]init];
        [self addSubview:self.view0];
        [self.view0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(self.buttonView.mas_bottom);
            make.height.mas_equalTo(4 *45);
        }];
        self.view0.hidden = YES;
        self.view0.backgroundColor = kWhiteColor;
        UIButton *button01 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view0 addSubview:button01];
        button01.tag = 201;
        [button01 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            
           make.size.mas_equalTo(CGSizeMake(kWindowWidth, 44));
        }];
        [button01 addTarget:self action:@selector(buttonTypeAction:) forControlEvents:UIControlEventTouchUpInside];
        button01.titleLabel.font = kFontSize(14);
        [button01 setTitleColor:kStringColor forState:UIControlStateNormal];

        UILabel *label01 = [[UILabel alloc]init];
        [button01 addSubview:label01];
        [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/5);
            make.left.mas_equalTo(20);
        }];
        label01.tag = 301;
        label01.text = @"综合";
        label01.textColor = kStringColor;
        label01.font = kFontSize(14);

        UIView *lineView01 = [[UIView alloc]init];
        [self.view0 addSubview:lineView01];
        [lineView01 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(.5);
            make.top.equalTo(button01.mas_bottom);
        }];
        lineView01.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];

        UIButton *button02 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view0 addSubview:button02];
        [button02 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(button01.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(kWindowWidth, 44));
        }];
        button02.tag = 202;
        button02.titleLabel.font = kFontSize(14);
        [button02 setTitleColor:kStringColor forState:UIControlStateNormal];
        [button02 addTarget:self action:@selector(buttonTypeAction:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label02 = [[UILabel alloc]init];
        [button02 addSubview:label02];
        [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/5);
            make.left.mas_equalTo(20);
        }];
        label02.text = @"信用";
        label02.textColor = kStringColor;
        label02.font = kFontSize(14);
        label02.tag = 302;
        
        UIView *lineView02 = [[UIView alloc]init];
        [self.view0 addSubview:lineView02];
        [lineView02 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(.5);
            make.top.equalTo(button02.mas_bottom);
        }];
        lineView02.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];

        UIButton *button03 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view0 addSubview:button03];
        [button03 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(button02.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(kWindowWidth, 44));
        }];
        [button03 addTarget:self action:@selector(buttonTypeAction:) forControlEvents:UIControlEventTouchUpInside];
        button03.titleLabel.font = kFontSize(14);
        [button03 setTitleColor:kStringColor forState:UIControlStateNormal];
        button03.tag = 203;
        UILabel *label03 = [[UILabel alloc]init];
        [button03 addSubview:label03];
        [label03 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/5);
            make.left.mas_equalTo(20);
        }];
        label03.text = @"价格降序";
        label03.textColor = kStringColor;
        label03.font = kFontSize(14);
        label03.tag = 303;

        UIView *lineView03 = [[UIView alloc]init];
        [self.view0 addSubview:lineView03];
        [lineView03 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(.5);
            make.top.equalTo(button03.mas_bottom);
        }];
        lineView03.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];

        UIButton *button04 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view0 addSubview:button04];
        [button04 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(button03.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(kWindowWidth, 44));
        }];

        [button04 addTarget:self action:@selector(buttonTypeAction:) forControlEvents:UIControlEventTouchUpInside];

        button04.titleLabel.font = kFontSize(14);
        [button04 setTitleColor:kStringColor forState:UIControlStateNormal];
        button04.tag = 204;
        UILabel *label04 = [[UILabel alloc]init];
        [button04 addSubview:label04];
        [label04 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/5);
            make.left.mas_equalTo(20);
        }];
        label04.text = @"价格升序";
        label04.textColor = kStringColor;
        label04.font = kFontSize(14);
        label04.tag = 304;

        UIView *lineView04 = [[UIView alloc]init];
        [self.view0 addSubview:lineView04];
        [lineView04 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(.5);
            make.top.equalTo(button03.mas_bottom);
        }];
        lineView04.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];

        self.bgView01 = [[UIView alloc]init];
        [self addSubview:self.bgView01];

        [self.bgView01 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.equalTo(self.view0.mas_bottom);
        }];
        
        self.bgView01.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
        self.bgView01.hidden = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [self.bgView01 addGestureRecognizer:tap];
        
     //---------------------------------------------------------

        
    }
    return self;
}

- (void)showView
{
    
    if ([self.delegate respondsToSelector:@selector(showSonSelectView)])
    {
        [self.delegate showSonSelectView];
    }
}

// 背景图层点击事件
- (void)tapAction
{
     [self button1AcionHiddenYes:YES];
}
// buttonView 的点击事件
- (void)buttonAction:(UIButton *)sender
{
   
    if (self.buttonTag != sender.tag)
    {
        UIButton *btn = [self viewWithTag:self.buttonTag];
        btn.selected = NO;
        
        if ((sender.selected == NO)|| (sender.tag == 101))
        {
            self.buttonIndex = sender.tag - 100;
            sender.selected = YES;
            self.buttonTag = sender.tag;
            
        }else
        {
            self.buttonIndex = -1;
            sender.selected = NO;
        }
        
    }
    else
    {
        sender.selected = YES;
        
        //        if (sender.tag == 104) {
        //            sender.selected = YES;
        //        }else
        //        {
        //             self.button1.selected = YES;
        //        }
        
    }
    
    
    
    
   
    if (sender.tag == 101)
    {
        [self button1AcionHiddenYes:NO];
    }else
    {
        [self button1AcionHiddenYes:YES];
    }
    
    if (sender.tag == 104) {
        
        NSLog(@"show View");
         [self showView];
    }
    
}

//  综合按钮  显示隐藏
- (void)button1AcionHiddenYes:(BOOL)slected
{
    self.bgView01.hidden = slected;
    
    [UIView animateWithDuration:1 animations:^{
        
        self.view0.hidden = slected;
    }];
}

// 综合 选择
- (void)buttonTypeAction:(UIButton *)sender
{
    
    if ((self.buttonTag2 != -200) && (self.buttonTag2 != sender.tag))
    {
        UIButton *btn = [self viewWithTag:self.buttonTag2];
        btn.selected = NO;
        
        NSInteger tag  = self.buttonTag2 - 200;
     
        UILabel *label = [self viewWithTag:300+ tag];
        label.textColor = kStringColor;
        
    }
    
    if (sender.selected == NO) {
        
        self.buttonIndex2 = sender.tag - 200;
        self.buttonTag2 = sender.tag;
        sender.selected = YES;
        NSInteger tag  = sender.tag - 200;
        
        UILabel *label = [self viewWithTag:300+ tag];
        label.textColor = kPickColor;
        
        NSString *string = self.titleArray[tag-1];
        
        self.button1.titleLabel.text = string;
        
        [self.button1 setTitle:string forState:UIControlStateNormal];
        [self.button1 setImage:[UIImage imageNamed:@"upSJX"] forState:UIControlStateSelected];
        [self.button1 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleLeft imageTitleSpace:0];
    }
    else
    {
        self.buttonIndex2 = -1;
        sender.selected = NO;
        
    }
    
    [self button1AcionHiddenYes:YES];
}

@end

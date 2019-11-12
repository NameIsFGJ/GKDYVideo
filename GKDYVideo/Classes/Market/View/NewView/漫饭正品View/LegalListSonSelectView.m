//
//  LegalListSonSelectView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "LegalListSonSelectView.h"
#import "TypeView.h"
@interface LegalListSonSelectView ()<TypeViewSelectDelegate>
// 筛选需要用到的属性
@property (strong, nonatomic) UIView *bgView;

@property (strong, nonatomic) UIView *contentView;

@property (assign, nonatomic) float navHeight;

@property (strong, nonatomic) TypeView *brandView;
@end

@implementation LegalListSonSelectView

- (instancetype)init
{
    self = [super init];
    if (self) {

        [self addSubview:self.bgView];
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(45);
           
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [self.bgView addGestureRecognizer:tap];
        
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.mas_equalTo(0);
            make.left.equalTo(self.bgView.mas_right);
        }];
        
        float leftWidth = 14;
       // float sizeWidth = self.contentView
        
        UILabel *label0 = [[UILabel alloc]init];
        [self.contentView addSubview:label0];
        [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftWidth);
            make.top.mas_equalTo(55);
        }];
        label0.text = @"筛选";
        label0.textColor = kPickColor;
        label0.font = kFontSize(12);
        
        UILabel *label1 = [[UILabel alloc]init];
        [self.contentView addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.equalTo(label0.mas_bottom).offset(40);
        }];
        label1.text = @"价格";
        label1.textColor = [UIColor blackColor];
        label1.font = kFontSize(15);
        
        UILabel *label11 = [[UILabel alloc]init];
        [self.contentView addSubview:label11];
        [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.top.equalTo(label1.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(50, 30));
        }];
        label11.text = @"——";
        label11.textAlignment = NSTextAlignmentCenter;
       // label11.backgroundColor = kMainColor;
        UITextField *textField0 = [[UITextField alloc]init];
        [self.contentView addSubview:textField0];
        [textField0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftWidth);
            make.top.equalTo(label1.mas_bottom).offset(10);
            make.right.equalTo(label11.mas_left).mas_equalTo(0);
            make.height.mas_equalTo(30);
        }];
        textField0.backgroundColor = kBgColor;
        textField0.textAlignment = NSTextAlignmentCenter;
        textField0.placeholder = @"最低价";
        
        UITextField *textField1 = [[UITextField alloc]init];
        [self.contentView addSubview:textField1];
        [textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftWidth);
            make.top.equalTo(label1.mas_bottom).offset(10);
            make.left.equalTo(label11.mas_right).mas_equalTo(0);
            make.height.mas_equalTo(30);
        }];
        textField1.backgroundColor = kBgColor;
        textField1.textAlignment = NSTextAlignmentCenter;
        textField1.placeholder = @"最高价";
        
        UILabel *label2 = [[UILabel alloc]init];
        [self.contentView addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftWidth);
            make.top.equalTo(textField0.mas_bottom).offset(20);
        }];
        label2.text = @"品牌";
        label2.textColor = [UIColor blackColor];
        label2.font = kFontSize(15);
        
        NSArray *brandArray = [NSArray arrayWithObjects:@"航海一生",@"德德珠宝",@"浪漫德坤",@"朋克宽带",@"欧氏鸥鸟",@"纽约微笑", nil];
        
        self.brandView = [[TypeView alloc]initWithDatasource:brandArray andTitleName:@""];
        [self.contentView addSubview:self.brandView];
        self.brandView.delegate = self;
        NSInteger sizeHeight = brandArray.count / 2;
        [self.brandView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftWidth);
            make.right.mas_equalTo(-leftWidth);
            make.top.equalTo(label2.mas_bottom);
            make.height.mas_equalTo(30+50 *sizeHeight);
        }];
        
        UILabel *label3 = [[UILabel alloc]init];
        [self.contentView addSubview:label3];
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftWidth);
            make.top.equalTo(self.brandView.mas_bottom).offset(20);
        }];
        label3.text = @"发货地";
        label3.textColor = [UIColor blackColor];
        label3.font = kFontSize(15);
        
        UIButton *button33 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button33];
        [button33 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftWidth);
            make.top.equalTo(label3.mas_bottom).offset(30);
            make.size.mas_equalTo(CGSizeMake(140, 35));
        }];
        
        [button33 setTitle:@"杭州" forState:UIControlStateNormal];
        button33.titleLabel.font = kFontSize(12);
        [button33 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button33 setImage:[UIImage imageNamed:@"location_Nor"] forState:UIControlStateNormal];
        [button33 setImage:[UIImage imageNamed:@"location_Sel"] forState:UIControlStateSelected];
        [button33 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleRight imageTitleSpace:20];
        [button33 setBackgroundColor: kBgColor];
        [button33 addTarget:self action:@selector(button33Action:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button34 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button34];
        [button34 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(button33.mas_right).offset(20);
            make.centerY.equalTo(button33.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(60, 30));
        }];
        [button34 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button34 setTitle:@"定位" forState:UIControlStateNormal];
        button34.titleLabel.font = kFontSize(12);
        [button34 setImage:[UIImage imageNamed:@"shuaxin"] forState:UIControlStateNormal];
        [button34 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleRight imageTitleSpace:20];
        
        UIButton *button40 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button40];
        [button40 mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.bottom.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.width.equalTo(self.contentView.mas_width).multipliedBy(.5);
        }];
        [button40 setTitle:@"重置" forState:UIControlStateNormal];
        [button40 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button40.titleLabel.font = kFontSize(15);
        button40.layer.borderWidth = .5;
        button40.layer.borderColor = kBgColor.CGColor;
        
        UIButton *button41 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button41];
        [button41 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.width.equalTo(self.contentView.mas_width).multipliedBy(.5);
        }];
        [button41 setTitle:@"确定" forState:UIControlStateNormal];
        button41.titleLabel.font = kFontSize(15);
        [button41 setBackgroundColor:kPickColor];
        
    }
    return self;
}

- (void)button33Action:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (void)tapAction
{
    self.block();
}

- (void)btnIndexTypeView:(TypeView *)view buttonTag:(int)tag;
{
    NSLog(@"tag =%d",tag);
}
#pragma mark lazyLoad

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
    }
    return _bgView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = kWhiteColor;
    }
    return _contentView;
}

@end

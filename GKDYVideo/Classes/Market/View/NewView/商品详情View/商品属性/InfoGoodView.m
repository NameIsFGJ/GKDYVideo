//
//  InfoGoodView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/28.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "InfoGoodView.h"
#import "TypeView.h"

static NSInteger viewHeight = 483;

@interface InfoGoodView()<TypeViewSelectDelegate>

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) TypeView *sizeView;
@property (strong, nonatomic) TypeView *colorView;
@property (strong, nonatomic) UILabel *countLabel;
@end

@implementation InfoGoodView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIView *bgView = [[UIView alloc]init];
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(kWindowHeight-viewHeight);
            
        }];
        bgView.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
    
        self.contentView = [[UIView alloc]init];
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-kWindowHeight+viewHeight);
            make.height.mas_equalTo(viewHeight);
        }];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapButtonAction)];
        
        [bgView addGestureRecognizer:tap];
        
        UIView *view0 = [[UIView alloc]init];
        [self.contentView addSubview:view0];
        [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(140);
        }];
        
        UIImageView *goodImageView = [[UIImageView alloc]init];
        [view0 addSubview:goodImageView];
        [goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(86, 86));
            make.centerY.equalTo(view0.mas_centerY);
        }];
        goodImageView.backgroundColor = [UIColor blueColor];
        
        UILabel *label1 = [[UILabel alloc]init];
        [view0 addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(goodImageView.mas_right).offset(10);
            make.centerY.equalTo(view0.mas_centerY);
        }];
        label1.text = @"库存:1211";
        label1.textColor = [UIColor colorWithHex:@"#999999"];
        label1.font = kFontSize(14);
        
        UILabel *label0 = [[UILabel alloc]init];
        [view0 addSubview:label0];
        [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label1.mas_left).offset(0);
            make.top.equalTo(goodImageView.mas_top);
            make.right.mas_equalTo(-60);
        }];
        label0.text = @"短款连帽卫衣女装秋装2019款短款连帽卫衣女装秋装20";
        label0.font = kFontSize(14);
        label0.numberOfLines = 0;
        
        UILabel *label2 = [[UILabel alloc]init];
        [view0 addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label0.mas_left).offset(0);
            make.bottom.equalTo(goodImageView.mas_bottom);
        }];
        label2.text = @"¥256";
        label2.textColor = kPickColor;
        label2.font = kFontSize(14);
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [view0 addSubview:closeButton];
        
        [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.size.mas_equalTo(CGSizeMake(40, 40));
             make.top.equalTo(goodImageView.mas_top);
        }];
        
        [closeButton setImage:[UIImage imageNamed:@"yhq_close"] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(tapButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        NSArray *sizeArray = [NSArray arrayWithObjects:@"M",@"L",@"XL",@"XXL",@"XXXL",@"XXXXL", nil];
        self.sizeView = [[TypeView alloc]initWithDatasource:sizeArray andTitleName:@"尺寸"];
        [self addSubview:self.sizeView];
        self.sizeView.delegate = self;
        NSInteger sizeHeight = sizeArray.count / 3;
        [self.sizeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(view0.mas_bottom);
            make.height.mas_equalTo(30+50*sizeHeight);
        }];
        
        NSArray *colorArray = [NSArray arrayWithObjects:@"红色",@"粉红色",@"大红色", nil];
        NSInteger colorHeight = colorArray.count / 3;
        self.colorView = [[TypeView alloc]initWithDatasource:colorArray andTitleName:@"颜色"];
        [self addSubview:self.colorView];
        self.colorView.delegate = self;
        
        [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(self.sizeView.mas_bottom);
            make.height.mas_equalTo(30+50*colorHeight);
        }];
        
       
        UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:submitButton];
        [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        [submitButton setTitle:@"确定" forState:UIControlStateNormal];
        submitButton.titleLabel.font = kFontSize(15);
        [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [submitButton setBackgroundColor:kPickColor];
        [submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *view3 = [[UIView alloc]init];
        [self addSubview:view3];
        [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.bottom.equalTo(submitButton.mas_top);
        }];
        
        UIView *lineView = [[UIView alloc]init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.height.mas_equalTo(.6);
            make.bottom.equalTo(view3.mas_top).offset(0);
        }];
        lineView.backgroundColor = kBgColor;
        
        UILabel *label3 = [[UILabel alloc]init];
        [view3 addSubview:label3];
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerY.equalTo(view3.mas_centerY);
        }];
        label3.text = @"购买数量";
        label3.font = kFontSize(14);
        
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [view3 addSubview:addButton];
        [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.equalTo(view3.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(28, 28));
        }];
        [addButton setTitle:@"+" forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(addButtonActon) forControlEvents:UIControlEventTouchUpInside];
        addButton.tag =201;
        addButton.layer.borderWidth = .5;
        addButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        addButton.layer.masksToBounds = YES;
        [addButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        self.countLabel = [[UILabel alloc]init];
        [view3 addSubview:self.countLabel];
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view3.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(28, 28));
            make.right.equalTo(addButton.mas_left).offset(0);
        }];
        self.countLabel.text = @"3";
        self.countLabel.font = [UIFont systemFontOfSize:15];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.layer.borderWidth = .5;
        self.countLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.countLabel.layer.masksToBounds = YES;
        self.countLabel.textColor = [UIColor blackColor];
        UIButton *subButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [view3 addSubview:subButton];
        [subButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.countLabel.mas_left).offset(0);
            make.centerY.equalTo(view3.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(28, 28));
        }];
        [subButton setTitle:@"-" forState:UIControlStateNormal];
        [subButton addTarget:self action:@selector(subButtonAction) forControlEvents:UIControlEventTouchUpInside];
        subButton.tag =201;
        [subButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        subButton.layer.borderWidth = .5;
        subButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        subButton.layer.masksToBounds = YES;
        
        
        
    }
    return self;
}

- (void)addButtonActon
{
    NSInteger count = [self.countLabel.text intValue];
    count +=1;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",(long)count];
}

- (void)subButtonAction
{
    NSInteger count = [self.countLabel.text intValue];
    count -=1;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",(long)count];
}

- (void)submitButtonAction
{
    self.block();
    [self tapButtonAction];
}

- (void)animation
{
    [UIView animateWithDuration:5 animations:^{
        [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(viewHeight);
        }];
    }];
}

- (void)tapButtonAction
{
    self.hidden = YES;
    
    [UIView animateWithDuration:5 animations:^{
        [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-kWindowHeight+viewHeight);
            make.height.mas_equalTo(viewHeight);
        }];
    }];
    
}

- (void)btnIndexTypeView:(TypeView *)view buttonTag:(int)tag;
{
    if (view == self.sizeView)
    {
        NSLog(@"sizeView tag  =%d",tag);
    }else if (view == self.colorView)
    {
        NSLog(@"colorView tag  =%d",tag);
    }
}

@end

//
//  AboutUSViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AboutUSViewController.h"

@interface AboutUSViewController ()

@end

@implementation AboutUSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"关于我们";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)makeUI
{
    
    UIView *contentView = [[UIView alloc]init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    contentView.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1];
    
    UIView *view0 = [[UIView alloc]init];
    [contentView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(1);
        make.height.mas_equalTo(208);
    }];
    view0.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView0 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"paySuccess"]];
    [view0 addSubview:imageView0];
    [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    UILabel *label0 = [[UILabel alloc]init];
    [view0 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view0.mas_centerX);
        make.top.equalTo(imageView0.mas_bottom).offset(5);
    }];
    label0.text = @"版本号1.0";
    label0.font = [UIFont systemFontOfSize:18];
    
    
    UIView *view1 = [[UIView alloc]init];
    [contentView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom).offset(8);
        make.height.mas_equalTo(55);
    }];
    view1.backgroundColor = [UIColor whiteColor];
    UILabel *label1 = [[UILabel alloc]init];
    [view1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
        
    }];
    label1.text = @"服务电话";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:15];
    
    UILabel *label11 = [[UILabel alloc]init];
    [view1 addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(150);
        make.right.mas_equalTo(0);
        
    }];
    label11.text = @"400-827-1258";
    label11.textAlignment = NSTextAlignmentCenter;
    label11.font = [UIFont systemFontOfSize:15];
    
   
    
}



@end

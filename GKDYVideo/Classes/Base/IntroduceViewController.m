//
//  IntroduceViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/27.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "IntroduceViewController.h"

@interface IntroduceViewController ()

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label1 = [[UILabel alloc]init];
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(100);
    }];
    
    label1.text = @"欢迎来到漫饭";
    label1.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:22.0f];
    label1.textAlignment = NSTextAlignmentCenter;
    
    UILabel *label2 = [[UILabel alloc]init];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label1.mas_bottom).offset(20);
    }];
    
    label1.text = @"完善信息,遇见更有趣的TA";
    label1.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15.0];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor colorWithHex:@"#999999"];
    
    
    
    
}

@end

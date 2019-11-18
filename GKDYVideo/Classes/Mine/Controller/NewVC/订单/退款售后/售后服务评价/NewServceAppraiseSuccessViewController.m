//
//  NewServceAppraiseSuccessViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewServceAppraiseSuccessViewController.h"

@interface NewServceAppraiseSuccessViewController ()

@end

@implementation NewServceAppraiseSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeNav];
    
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"售后服务评价";
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

@end

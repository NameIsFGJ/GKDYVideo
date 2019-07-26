//
//  SearchMainViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchMainViewController.h"
#import "SearchView.h"
@interface SearchMainViewController ()

@end

@implementation SearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)creatNav
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 25, 40, 40);
    [backButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    SearchView *searchView = [[SearchView alloc]init];
    searchView.frame = CGRectMake(40, 25, 260, 34);
    [self.view addSubview:searchView];
    
}

- (void)buttonAction
{
    NSLog(@"点击");
    [self.navigationController popViewControllerAnimated:YES];
}
@end

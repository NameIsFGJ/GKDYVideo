//
//  GKDYSearchViewController.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKDYSearchViewController.h"
#import "SearchView.h"
@interface GKDYSearchViewController ()

@end

@implementation GKDYSearchViewController

- (void)loadView {
    self.view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    [self creatNav];
    
}

- (void)creatNav
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 25, 40, 40);
    [backButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
//    SearchView *searchView = [[SearchView alloc]init];
//    searchView.frame = CGRectMake(40, 25, 260, 34);
//    [self.view addSubview:searchView];
    // UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btnView];
    //self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)buttonAction
{
    NSLog(@"点击");
}
@end

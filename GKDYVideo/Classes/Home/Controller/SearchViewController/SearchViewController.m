//
//  SearchViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

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
    
    SearchView *searchView = [[SearchView alloc]init];
    searchView.frame = CGRectMake(40, 25, 260, 34);
    [self.view addSubview:searchView];
    
}

- (void)buttonAction
{
    NSLog(@"点击");
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  GKDYBaseViewController.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKDYBaseViewController.h"

@interface GKDYBaseViewController ()
@end

@implementation GKDYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     self.control = [[HomeSegmentedControl alloc]initWithItems:@[@"推荐",@"关注"] AndWithFrame:CGRectMake((kWindowWidth - 100)/2, 0, 100, 30)];
   // self.gk_navTitleView = self.control;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   // self.gk_navLineHidden = NO;
    self.gk_statusBarHidden = NO;
}

@end

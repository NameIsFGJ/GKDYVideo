//
//  SetViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    kUser.user_token = @"";
    kUser.user_id = @"";
    kUser.mobile = @"";
    kUser.nickname = @"";
    kUser.head_pic = @"";
    kUser.money = @"";
    [self showNormalMsg:@"退出登录"];
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

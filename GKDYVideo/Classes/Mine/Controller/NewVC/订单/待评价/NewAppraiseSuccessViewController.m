//
//  NewAppraiseSuccessViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewAppraiseSuccessViewController.h"

@interface NewAppraiseSuccessViewController ()

@end

@implementation NewAppraiseSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)popButtonAction:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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

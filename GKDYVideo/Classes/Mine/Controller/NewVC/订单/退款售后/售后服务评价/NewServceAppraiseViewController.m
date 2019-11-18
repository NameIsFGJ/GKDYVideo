//
//  NewServceAppraiseViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewServceAppraiseViewController.h"
#import "NewServceAppraiseSuccessViewController.h"
@interface NewServceAppraiseViewController ()

@end

@implementation NewServceAppraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)submitButtonAction:(UIButton *)sender {
    
    NewServceAppraiseSuccessViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewServceAppraiseSuccessViewController"];
    [self.navigationController pushViewController:vc animated:YES];
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

//
//  NewEditNameViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/1.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewEditNameViewController.h"

@interface NewEditNameViewController ()

@end

@implementation NewEditNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeNav];
    
    
}
- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"修改名字";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
   // [rightButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(finishVC) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)finishVC
{
    [self pushViewController];
}

@end

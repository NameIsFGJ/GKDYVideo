//
//  AddVideoViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/27.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddVideoViewController.h"
#import "MusicsViewController.h"
@interface AddVideoViewController ()

@end

@implementation AddVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 10, 35, 35);
    [backButton setBackgroundColor:[UIColor blackColor]];
    [backButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UIButton *musicButton = [UIButton buttonWithType:UIButtonTypeCustom];
    musicButton.frame = CGRectMake(10, 70, 35, 35);
    [musicButton setBackgroundColor:[UIColor blackColor]];
    [musicButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [musicButton addTarget:self action:@selector(presentViewcontroller:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:musicButton];
    
    
}

- (void)backButtonEvent:(id)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)presentViewcontroller:(UIButton *)btn
{
    MusicsViewController *vc = [[MusicsViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end

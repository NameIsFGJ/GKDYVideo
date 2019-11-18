//
//  NewMarketOrderSuccessViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMarketOrderSuccessViewController.h"

@interface NewMarketOrderSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation NewMarketOrderSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kWhiteColor;
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"确认订单";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    self.button1.layer.borderWidth = .5;
    self.button1.layer.borderColor = [UIColor blackColor].CGColor;
    self.button1.layer.masksToBounds = YES;
    
    self.button2.layer.borderWidth = .5;
    self.button2.layer.borderColor = [UIColor blackColor].CGColor;
    self.button2.layer.masksToBounds = YES;
}
- (IBAction)button1Action:(UIButton *)sender
{
    NSLog(@"查看订单");
}

- (IBAction)button2Action:(UIButton *)sender
{
    NSLog(@"返回订单");
    NSLog(@"self.navigationController  =%@",self.navigationController);
    [self dismissViewControllerAnimated:YES completion:nil];
   // [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

@end

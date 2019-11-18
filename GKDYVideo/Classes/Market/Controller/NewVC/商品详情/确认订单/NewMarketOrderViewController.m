//
//  NewMarketOrderViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMarketOrderViewController.h"
#import "NewMarketOrderSuccessViewController.h"
@interface NewMarketOrderViewController ()

@end

@implementation NewMarketOrderViewController

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
    UIView *lineView1 = [[UIView alloc]init];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(.3);
    }];
    lineView1.backgroundColor = [UIColor lightGrayColor];
}
- (IBAction)submitButtonAction:(UIButton *)sender {
    NewMarketOrderSuccessViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewMarketOrderSuccessViewController"];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

@end

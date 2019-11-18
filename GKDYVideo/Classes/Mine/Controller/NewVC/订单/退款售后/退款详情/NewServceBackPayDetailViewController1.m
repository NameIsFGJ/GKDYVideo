//
//  NewServceBackPayDetailViewController1.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/18.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewServceBackPayDetailViewController1.h"

@interface NewServceBackPayDetailViewController1 ()
@property (weak, nonatomic) IBOutlet UILabel *backPayDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *backPayStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *backPayMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *backPayAlipayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsDescribeLabel;
@property (weak, nonatomic) IBOutlet UILabel *reasonLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation NewServceBackPayDetailViewController1

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = kWhiteColor;
    [self makeNav];
    
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"退款详情";
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

#pragma mark Actions
- (IBAction)contactButtonAction:(UIButton *)sender {
    NSLog(@"联系卖家");
}

- (IBAction)phoneCallButtonAction:(UIButton *)sender {
     NSLog(@"拨打电话");
}

@end

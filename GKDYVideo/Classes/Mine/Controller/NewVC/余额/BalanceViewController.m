//
//  BalanceViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BalanceViewController.h"
#import "BalanceDetailViewController.h"
#import "RechargeViewController.h"

@interface BalanceViewController ()
@property (weak, nonatomic) IBOutlet UIButton *rechargeButton;

@end

@implementation BalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeUI];
    [self makeNav];
}

- (void)makeNav
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"明细" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)rightButtonAction
{
    NSLog(@"明细");
    BalanceDetailViewController *vc = [[BalanceDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)makeUI
{
//    UIView *lineView1 = [[UIView alloc]init];
//    [self.view addSubview:lineView1];
//    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.top.mas_equalTo(KTopViewHeight);
//        make.height.mas_equalTo(.3);
//    }];
//    lineView1.backgroundColor = [UIColor lightGrayColor];
    
    self.rechargeButton.layer.cornerRadius = 15;
    self.rechargeButton.layer.masksToBounds = YES;
}
    
- (IBAction)recharButtonAction:(UIButton *)sender
{
    RechargeViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"RechargeViewController"];
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

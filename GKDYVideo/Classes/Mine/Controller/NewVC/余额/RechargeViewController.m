//
//  RechargeViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "RechargeViewController.h"

@interface RechargeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *moneyTextField;
@property (weak, nonatomic) IBOutlet UIView *view0;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIButton *recharButton;
@property (assign, nonatomic) NSInteger buttonTag;


@end

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kWhiteColor;
    [self makeNav];
    [self makeUI];
    
}
- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"充值";
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
    
    self.recharButton.layer.cornerRadius = 15;
    self.recharButton.layer.masksToBounds = YES;
    
    self.buttonTag = 101;
    
    
}
- (IBAction)rechargeButtonAction:(UIButton *)sender {
    
    NSLog(@"点击立即充值");
}

- (IBAction)payButtonAction:(UIButton *)sender
{
    
    if (self.buttonTag != sender.tag)
    {
        
        UIButton *btn = [self.view viewWithTag:self.buttonTag];
        [btn setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
        btn.selected = NO;
    }
    
    if (sender.selected == NO)
    {
        [sender setImage:[UIImage imageNamed:@"reasonSelected"] forState:UIControlStateNormal];
        self.buttonTag = sender.tag;
        sender.selected = YES;
    }
    else
    {
          [sender setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
          sender.selected = NO;
    }
    
    
    NSString *str = self.buttonTag == 101 ? @"101":@"102";
    NSLog(@"str   =%@",str);
    
}


@end

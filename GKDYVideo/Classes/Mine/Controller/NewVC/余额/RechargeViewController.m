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

@end

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
- (IBAction)rechargeButtonAction:(UIButton *)sender {
    
    NSLog(@"点击立即充值");
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

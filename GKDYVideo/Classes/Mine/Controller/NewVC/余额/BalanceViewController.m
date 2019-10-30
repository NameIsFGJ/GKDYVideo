//
//  BalanceViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BalanceViewController.h"

@interface BalanceViewController ()
@property (weak, nonatomic) IBOutlet UIButton *rechargeButton;

@end

@implementation BalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)recharButtonAction:(UIButton *)sender {
    
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

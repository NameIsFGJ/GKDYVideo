//
//  NewGoldViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/28.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewGoldViewController.h"
#import "NewGoldListViewController.h"

@interface NewGoldViewController ()
@property (weak, nonatomic) IBOutlet UILabel *goldLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthGoldLabel;

@end

@implementation NewGoldViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)popButtonAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)getGoldListButtonAction:(UIButton *)sender {
    NewGoldListViewController *vc = [[NewGoldListViewController alloc]init];
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

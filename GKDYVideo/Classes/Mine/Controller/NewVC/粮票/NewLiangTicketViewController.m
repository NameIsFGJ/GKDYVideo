//
//  NewLiangTicketViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/12/3.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewLiangTicketViewController.h"
#import "NewLiangListViewController.h"
@interface NewLiangTicketViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ticketCountLabel;

@end

@implementation NewLiangTicketViewController

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

- (IBAction)listButtonAction:(UIButton *)sender {
    NSLog(@"获得记录");
    NewLiangListViewController *vc = [[NewLiangListViewController alloc]init];
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

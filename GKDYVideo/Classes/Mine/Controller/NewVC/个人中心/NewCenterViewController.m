//
//  NewCenterViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewCenterViewController.h"
#import "NewExplainViewController.h"

@interface NewCenterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
@property (weak, nonatomic) IBOutlet UIButton *followButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UILabel *followingLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
@property (weak, nonatomic) IBOutlet UILabel *collectLabel;
@property (weak, nonatomic) IBOutlet UILabel *gainLabel;
@property (weak, nonatomic) IBOutlet UILabel *giveLabel;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *lineView;



@end

@implementation NewCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushExplainVC)];
    [self.view2 addGestureRecognizer:tap];
    
}

- (void)pushExplainVC
{
    NewExplainViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewExplainViewController"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


@end

//
//  NewCenterViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewCenterViewController.h"
#import "NewExplainViewController.h"
#import "NewEditViewController.h"
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
    
    [self makeNav];
    
    [self makeUI];
}

- (void)makeNav
{
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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushExplainVC)];
    [self.view2 addGestureRecognizer:tap];
    
}


- (void)pushExplainVC
{
    NewExplainViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewExplainViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)pushEditButtonAction:(UIButton *)sender {
    NewEditViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewEditViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end

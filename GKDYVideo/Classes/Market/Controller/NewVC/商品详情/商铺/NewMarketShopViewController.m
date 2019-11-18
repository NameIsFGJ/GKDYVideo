//
//  NewMarketShopViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMarketShopViewController.h"
#import "UIViewController+Hidden.h"
#import "ShopContentView.h"
#import "ShopShareView.h"
#import "NewMarketShopTypeViewController.h"
#import "NewMarketShopHotViewController.h"
#import "NewGoodsSearchViewController.h"
#import "MarketSearchViewController.h"

@interface NewMarketShopViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *navHeightConstraint;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) ShopShareView * shareView;

@end

@implementation NewMarketShopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
    self.view.backgroundColor = kWhiteColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (IS_iPhoneX) {
        self.navHeightConstraint.constant = 100;
        
    }else
    {
        self.navHeightConstraint.constant = 64;
    }
    
    ShopContentView *contentView = [[ShopContentView alloc]init];
    [self.contentView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.shareView = [[ShopShareView alloc]init];
    [self.view addSubview:self.shareView];
    [self.shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-kWindowHeight);
        make.height.mas_equalTo(kWindowHeight);
    }];
}

#pragma mark Actions

// 返回
- (IBAction)popButtonAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 关注
- (IBAction)followButtonAction:(UIButton *)sender
{
    NSLog(@"关注");
}

// 分享
- (IBAction)shareButtonAction:(UIButton *)sender
{
    NSLog(@"分享");
    [self.shareView showView];
}
- (IBAction)searchButtonAction:(UIButton *)sender
{
    NSLog(@"搜索页面");
    NewGoodsSearchViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewGoodsSearchViewController"];
   // MarketSearchViewController *vc = [[MarketSearchViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)bottomButtonAction:(UIButton *)sender {
    
   // NSLog(@"sender.titleLabel.text  =%@",sender.titleLabel.text);
    
    if (sender.tag == 102)
    {
        NewMarketShopHotViewController *vc = [[NewMarketShopHotViewController alloc]init];
        vc.titleName = @"商品热销";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (sender.tag == 103)
    {
        NewMarketShopHotViewController *vc = [[NewMarketShopHotViewController alloc]init];
         vc.titleName = @"商品分类";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (sender.tag == 104)
    {
        NSLog(@"查看客服");
    }
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

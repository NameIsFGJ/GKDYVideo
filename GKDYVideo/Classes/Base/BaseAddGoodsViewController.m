//
//  BaseAddGoodsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/31.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseAddGoodsViewController.h"

@interface BaseAddGoodsViewController ()

@end

@implementation BaseAddGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackGroundColor];
    [self setBackViewControler];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
}

-(void)setBackGroundColor
{
    self.view.backgroundColor = kWhiteColor;
}

- (void)setNavItemTitle
{
    self.navigationItem.title = self.title;
}

- (void)setBackViewControler
{
    if (self.navigationItem.leftBarButtonItems == nil)
    {
        if ( self.navigationController.viewControllers.count > 1)
        {
            self.navigationItem.leftBarButtonItems = @[[self backButtonItems]];
        }
    }
}

- (UIBarButtonItem *)backButtonItems
{
    UIImage *img = [UIImage imageNamed:@"fanhuiImage"];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:img
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(actionBack:)];
    item.tintColor = kWhiteColor;
    return item;
}

- (void)actionBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end

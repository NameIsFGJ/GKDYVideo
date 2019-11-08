//
//  BaseViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackViewControler];
    [self setBackGroundColor];
    [self setNavItemTitle];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = [self setupTarbarHidden];
}
- (void)setBackGroundColor
{
     self.view.backgroundColor = kMainColor
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
            self.navigationItem.leftBarButtonItems = @[[self backButtonItem]];
        }
    }
}

- (UIBarButtonItem *)backButtonItem
{
    UIImage *img = [UIImage imageNamed:@"common_white_back"];
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

- (BOOL)setupTarbarHidden
{
    return YES;
}

@end

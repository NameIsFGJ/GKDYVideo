//
//  GKDYBaseViewController.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKDYBaseViewController.h"

@interface GKDYBaseViewController ()
@end

@implementation GKDYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kMainColor
    [self setNavBarLeftButton];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.gk_statusBarHidden = NO;
}

- (void)setNavBarLeftButton{
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

@end

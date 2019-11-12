//
//  BaseViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UINavigationControllerDelegate>
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
   // self.tabBarController.tabBar.hidden = [self setupTarbarHidden];
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

- (void)navigationController:(UINavigationController*)navigationController willShowViewController:(UIViewController*)viewController animated:(BOOL)animated {
    
    if(viewController == self){
        [navigationController setNavigationBarHidden:YES animated:YES];
    }else{
        
        //系统相册继承自 UINavigationController 这个不能隐藏 所有就直接return
        if ([navigationController isKindOfClass:[UIImagePickerController class]]) {
            return;
        }
        
        //不在本页时，显示真正的navbar
        [navigationController setNavigationBarHidden:NO animated:YES];
        //当不显示本页时，要么就push到下一页，要么就被pop了，那么就将delegate设置为nil，防止出现BAD ACCESS
        //之前将这段代码放在viewDidDisappear和dealloc中，这两种情况可能已经被pop了，self.navigationController为nil，这里采用手动持有navigationController的引用来解决
        if(navigationController.delegate == self){
            //如果delegate是自己才设置为nil，因为viewWillAppear调用的比此方法较早，其他controller如果设置了delegate就可能会被误伤
            navigationController.delegate = nil;
        }
    }
}

@end

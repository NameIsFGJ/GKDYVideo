//
//  NSObject+HUD.m
//  FGJ_project
//
//  Created by fgj on 2018/8/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSObject+HUD.h"

#define kToastDuration     2


@implementation NSObject (HUD)
//显示普通
- (void)showNormalMsg:(NSObject *)msg
{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.detailsLabel.text = msg.description;
    progressHUD.detailsLabel.font = [UIFont systemFontOfSize:13];
   
    progressHUD.removeFromSuperViewOnHide = YES;
    [progressHUD hideAnimated:YES afterDelay:kToastDuration];
    
}

//显示失败提示
- (void)showError:(NSError *)error
{
    [self hideProgress];
     [self showErrorMsg:error.domain];
//    NSString *errorCode = error.userInfo[@"code"];
//    if (errorCode.length)
//    {
//        [self handleError:error];
//    }
//    else
//    {
//        if (error.domain.length != 0)
//        {
//            [self showErrorMsg:error.domain];
//        }
//    }
}

- (void)showErrorMsg:(NSObject *)msg
{
    if (msg.description.length == 0)
    {
        return;
    }
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeCustomView;
    progressHUD.detailsLabel.text = msg.description;
    progressHUD.detailsLabel.font = [UIFont systemFontOfSize:13];
    
    progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error"]];
    progressHUD.removeFromSuperViewOnHide = YES;
    [progressHUD hideAnimated:YES afterDelay:kToastDuration];
}

//显示成功提示
- (void)showSuccessMsg:(NSObject *)msg
{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeCustomView;
    progressHUD.detailsLabel.text = msg.description;
    progressHUD.detailsLabel.font = [UIFont systemFontOfSize:13];
    
    progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
    progressHUD.removeFromSuperViewOnHide = YES;
     [progressHUD hideAnimated:YES afterDelay:kToastDuration];
}

//显示忙
- (void)showProgress
{
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.removeFromSuperViewOnHide = YES;
}

//隐藏提示
- (void)hideProgress{
    [MBProgressHUD hideHUDForView:[self currentView] animated:YES];
}

- (UIView *)currentView{
    UIViewController *controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    if ([controller isKindOfClass:[UITabBarController class]]) {
        controller = [(UITabBarController *)controller selectedViewController];
    }
    if([controller isKindOfClass:[UINavigationController class]]) {
        controller = [(UINavigationController *)controller visibleViewController];
    }
    if (!controller) {
        return [UIApplication sharedApplication].keyWindow;
    }
    return controller.view;
}
@end

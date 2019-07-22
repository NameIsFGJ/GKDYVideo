//
//  GKDYBaseViewController.h
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import <GKNavigationBarViewController/GKNavigationBarViewController.h>
#import "HomeSegmentedControl.h"
NS_ASSUME_NONNULL_BEGIN

@interface GKDYBaseViewController : UIViewController
@property (strong, nonatomic)HomeSegmentedControl *control;
@end

NS_ASSUME_NONNULL_END

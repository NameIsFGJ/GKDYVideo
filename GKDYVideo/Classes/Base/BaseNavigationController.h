//
//  BaseNavigationController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationController : UINavigationController
@property (nonatomic, copy) void (^commandBlock)(void);
@end

NS_ASSUME_NONNULL_END

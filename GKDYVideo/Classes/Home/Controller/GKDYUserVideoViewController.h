//
//  GKDYUserVideoViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDYBaseViewController.h"

typedef enum{
    myOwnerVideo = 0,
    myLikeVideo
}ViewControllerType;
NS_ASSUME_NONNULL_BEGIN

@interface GKDYUserVideoViewController : GKDYBaseViewController
@property (assign, nonatomic)ViewControllerType vcType;

@end

NS_ASSUME_NONNULL_END

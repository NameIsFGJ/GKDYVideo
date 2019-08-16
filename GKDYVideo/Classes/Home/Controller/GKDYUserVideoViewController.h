//
//  GKDYUserVideoViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDYBaseViewController.h"

typedef enum{
    myOwnerVideo = 1,
    myLikeVideo
}ViewControllerType;
NS_ASSUME_NONNULL_BEGIN

@interface GKDYUserVideoViewController : GKDYBaseViewController
@property (assign, nonatomic)ViewControllerType vcType;
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)UICollectionView *mainView;
@end

NS_ASSUME_NONNULL_END

//
//  UploadViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PLSActionType) {
    PLSActionTypePlayer = 0,
    PLSActionTypeGif,
};

NS_ASSUME_NONNULL_BEGIN

@interface UploadViewController : UIViewController
@property (assign, nonatomic) PLSActionType actionType;
@property (strong, nonatomic) NSURL *url;
@end

NS_ASSUME_NONNULL_END

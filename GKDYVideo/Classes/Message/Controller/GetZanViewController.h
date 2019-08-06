//
//  GetZanViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger, ViewControllType)
{
  getZanViewControllerType = 0,
    getComViewControllerTyple,
};


NS_ASSUME_NONNULL_BEGIN

@interface GetZanViewController : BaseViewController
@property (assign, nonatomic) ViewControllType type;
@property (strong, nonatomic) NSString *titleName;
@end

NS_ASSUME_NONNULL_END

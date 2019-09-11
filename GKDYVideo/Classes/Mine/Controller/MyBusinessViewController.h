//
//  MyBusinessViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"

typedef enum{
    buyType = 1,
    sellTyle
}VCType;

NS_ASSUME_NONNULL_BEGIN

@interface MyBusinessViewController : BaseViewController
@property (assign, nonatomic)VCType type;

@end

NS_ASSUME_NONNULL_END

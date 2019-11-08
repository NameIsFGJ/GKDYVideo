//
//  RankListViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^LayoutHeaderViewBlock)(BOOL);
@interface RankListViewController : BaseViewController
@property (copy, nonatomic)LayoutHeaderViewBlock block;
@end

NS_ASSUME_NONNULL_END

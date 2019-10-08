//
//  ToPayView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToPayView : UIView
// 订单编号
@property (assign, nonatomic)NSInteger orderSn;
@property (assign, nonatomic)float orderAmount;

@end

NS_ASSUME_NONNULL_END

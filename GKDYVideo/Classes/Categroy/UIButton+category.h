//
//  UIButton+category.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, CLButtonEdgeInsetsTitleStyle) {
    CLButtonEdgeInsetsStyleTitleTop, // title在上
    CLButtonEdgeInsetsStyleTitleLeft, // title在左
    CLButtonEdgeInsetsStyleTitleBottom, // title在下
    CLButtonEdgeInsetsStyleTitleRight // title在右
};

@interface UIButton (category)
- (void)layoutButtonWithEdgeInsetsStyle:(CLButtonEdgeInsetsTitleStyle)style
                        imageTitleSpace:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END

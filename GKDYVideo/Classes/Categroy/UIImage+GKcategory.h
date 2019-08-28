//
//  UIImage+GKcategory.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/18.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GKcategory)
/**
 根据颜色生成图片
 
 @param color 颜色
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *) imageWithColor: (UIColor *) color;
//+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;



@end

NS_ASSUME_NONNULL_END

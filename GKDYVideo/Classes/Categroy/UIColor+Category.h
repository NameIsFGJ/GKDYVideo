//
//  UIColor+Category.h
//  BaseProject
//
//  Created by RockyYe on 2017/8/8.
//  Copyright © 2017年 RockyYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithHex:(NSString *)hexColor;
+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(CGFloat)fAlapa;

@end

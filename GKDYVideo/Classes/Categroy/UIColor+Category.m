//
//  UIColor+Category.m
//  BaseProject
//
//  Created by RockyYe on 2017/8/8.
//  Copyright © 2017年 RockyYe. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

+ (UIColor *)colorWithHex:(NSString *)hexColor
{
    return [self colorWithHex:hexColor alpha:1];
}

+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(CGFloat)fAlapa
{
    if (hexColor.length == 0) {
        return nil;
    }
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 1;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:fAlapa];
}

@end

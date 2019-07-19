//
//  UIImage+GKcategory.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/18.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UIImage+GKcategory.h"

@implementation UIImage (GKcategory)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
@end

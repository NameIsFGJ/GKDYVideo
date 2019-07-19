//
//  UIImage+Category.h
//  FGJ_project
//
//  Created by fgj on 2018/8/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@interface UIImage (Category)
+ (UIImage *) imageWithColor: (UIColor *) color;

+ (CGSize) fitSize: (CGSize)thisSize inSize: (CGSize) aSize;
+ (UIImage *) image: (UIImage *) image fitInSize: (CGSize) viewsize;

+ (UIImage*)blackWhite:(UIImage*)inImage;
+ (UIImage*)cartoon:(UIImage*)inImage;
+ (UIImage*)memory:(UIImage*)inImage;
+ (UIImage*)bopo:(UIImage*)inImage;
+ (UIImage*)scanLine:(UIImage*)inImage;

+ (UIImage *)rotateImage:(UIImage *)aImage;
+ (UIImage *)doImageBlacknWhite:(UIImage *)originalImage;

+ (UIImage *)imageWithContentsOfFileNamed:(NSString *)name;
+ (UIImage *)imageFromView:(UIView *)view;
+ (UIImage *)imageFromColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
@end

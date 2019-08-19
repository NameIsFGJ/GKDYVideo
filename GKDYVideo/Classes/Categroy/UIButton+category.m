//
//  UIButton+category.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UIButton+category.h"

@implementation UIButton (category)
/**
 设置button的titleLabel和imageView的布局样式，及间距
 
 @param style titleLabel和imageView的布局样式
 @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(CLButtonEdgeInsetsTitleStyle)style
                        imageTitleSpace:(CGFloat)space
{
    // 1. 得到imageView和titleLabel的size
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.bounds.size;
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space设置imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case CLButtonEdgeInsetsStyleTitleTop:
        {
            labelEdgeInsets = UIEdgeInsetsMake(0,-(imageSize.width), imageSize.height + space * 0.5, 0);
            imageEdgeInsets = UIEdgeInsetsMake(titleSize.height + space * 0.5, 0, 0, -(titleSize.width));
        }
            break;
        case CLButtonEdgeInsetsStyleTitleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width , 0, - titleSize.width - space * 0.5);
            labelEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, 0, imageSize.width + space * 0.5);
        }
            break;
        case CLButtonEdgeInsetsStyleTitleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0,0, titleSize.height + space * 0.5, -(titleSize.width));
            labelEdgeInsets = UIEdgeInsetsMake(imageSize.height + space * 0.5, -(imageSize.width), 0, 0);
        }
            break;
        case CLButtonEdgeInsetsStyleTitleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, self.imageEdgeInsets.left - space / 2, 0, 0);
            labelEdgeInsets = UIEdgeInsetsMake(0, self.titleEdgeInsets.left + space / 2, 0, 0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
@end

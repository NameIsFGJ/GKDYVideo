//
//  UIView+Acategory.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UIView+Acategory.h"

@implementation UIView (Acategory)
- (UIViewController *)viewController
{
    for (UIView *next = self.superview; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end

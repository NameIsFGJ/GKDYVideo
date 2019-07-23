//
//  HomeSegmentedControl.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "HomeSegmentedControl.h"
#import "UIImage+Category.h"
@implementation HomeSegmentedControl

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super initWithItems:items];
    
    self.tintColor = [UIColor whiteColor];
    self.selectedSegmentIndex = 0;
    self.momentary = NO;


  // 文字
    UIFont *font = [UIFont systemFontOfSize:16];
    UIColor*textColor = [UIColor lightGrayColor];
    NSDictionary *normalDic = @{NSFontAttributeName:font,NSForegroundColorAttributeName:textColor};
    [self setTitleTextAttributes:normalDic forState:UIControlStateNormal];

    UIFont *font1 = [UIFont systemFontOfSize:16];
    UIColor*textColor1 = [UIColor whiteColor];
    NSDictionary *selectDic = @{NSFontAttributeName:font1,NSForegroundColorAttributeName:textColor1};
    [self setTitleTextAttributes:selectDic forState:UIControlStateSelected];

    //去除边框
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    [self setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

    // 竖线
    [self setDividerImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(1, 10)] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    return self;
}
@end

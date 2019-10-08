//
//  PickSegmentedControl.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "PickSegmentedControl.h"

@implementation PickSegmentedControl

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super initWithItems:items];
    
    self.tintColor = [UIColor blackColor];
    self.selectedSegmentIndex = 0;
    self.momentary = NO;
    
    // 文字
    UIFont *font = [UIFont systemFontOfSize:16];
    UIColor*textColor = [UIColor colorWithHex:@"#999999"];
    NSDictionary *normalDic = @{NSFontAttributeName:font,NSForegroundColorAttributeName:textColor};
    [self setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    
    UIFont *font1 = [UIFont systemFontOfSize:16];
    UIColor*textColor1 = [UIColor colorWithHex:@"#F67797"];
    NSDictionary *selectDic = @{NSFontAttributeName:font1,NSForegroundColorAttributeName:textColor1};
    [self setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    
    //去除边框
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 竖线
    [self setDividerImage:[UIImage imageWithColor:[UIColor blackColor] size:CGSizeMake(1, 1)] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    return self;
}

@end

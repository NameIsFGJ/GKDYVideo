//
//  AppInfoConstant.h
//  BaseProject
//
//  Created by 冯高杰 on 2019/7/8.
//  Copyright © 2019 冯高杰. All rights reserved.
//

#ifndef AppInfoConstant_h
#define AppInfoConstant_h

#define kTabBar_Index_Home          0
#define kTabBar_Index_Investment    1
#define kTabBar_Index_Stock         2
#define kTabBar_Index_MySpace       3
#define kSERVICE   @"https://mf.zjchuanwen.com"
// 宽 高
#define kWindowWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kWindowHeight CGRectGetHeight([UIScreen mainScreen].bounds)

// 适配比例
#define ADAPTATIONRATIO     kWindowWidth / 750.0f

// 缩写
#define kImageName(name)    [UIImage imageNamed:name]
#define kFontSize(size)     [UIFont systemFontOfSize:size]

//UDID MD5_UDID
#define UDID [[[UIDevice currentDevice] identifierForVendor] UUIDString]
#define MD5_UDID [UDID md5]

// 判断是否是iPhone X系列
#define IS_iPhoneX      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?\
(\
CGSizeEqualToSize(CGSizeMake(375, 812),[UIScreen mainScreen].bounds.size)\
||\
CGSizeEqualToSize(CGSizeMake(812, 375),[UIScreen mainScreen].bounds.size)\
||\
CGSizeEqualToSize(CGSizeMake(414, 896),[UIScreen mainScreen].bounds.size)\
||\
CGSizeEqualToSize(CGSizeMake(896, 414),[UIScreen mainScreen].bounds.size))\
:\
NO)

#pragma mark - UI
// 屏幕宽高
//#define kWindowWidth        [UIScreen mainScreen].bounds.size.width
//#define kWindowHeight       [UIScreen mainScreen].bounds.size.height

// 导航栏高度与tabbar高度
#define NAVBAR_HEIGHT       (IS_iPhoneX ? 88.0f : 64.0f)
#define TABBAR_HEIGHT       (IS_iPhoneX ? 83.0f : 49.0f)

// 状态栏高度
#define STATUSBAR_HEIGHT    (IS_iPhoneX ? 44.0f : 20.0f)

// 来自YYKit
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* AppInfoConstant_h */

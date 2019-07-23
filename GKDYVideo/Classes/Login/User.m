//
//  User.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "User.h"
//com.manfan.ios
/*
 "user_token": "dd019e52079930cd51d1cbf9cfe76f0a",
 "user_id": 1,
 "mobile": "17826855181",
 "nick_name": "陆",
 "head_pic": "public/upload/user/20190429/28fd7f75eae8b4bbd79455a4bc9561a9.png",
 "user_money": "1000.00"
 */
NSString * const user_token = @"com.manfan.user_token";


@implementation Info

@end

static User *sharedInstance = nil;
@implementation User
+ (User *)currentUser
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[User alloc] init];
    });
    
    return sharedInstance;
}

+ (BOOL)isLogin;
{
    return kUser.user_token != nil && kUser.user_token.length > 0;
}

@end

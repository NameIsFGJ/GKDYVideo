//
//  User.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "User.h"
NSString * const kuser_token = @"com.manfan.user_token";
NSString * const kuser_id = @"com.manfan.user_id";
NSString * const kMobile = @"com.manfan.mobile";
NSString * const knick_name = @"com.manfan.nick_name";
NSString * const khead_pic = @"com.manfan.head_pic";
NSString * const kuser_money = @"com.manfan.user_money";
NSString * const khistory = @"com.manfan.history";
NSString * const ksex = @"com.manfan.sex";
NSString * const kGoodsHistory = @"com.manfan.goodsHistory";
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
    kUser.user_token =   [[NSUserDefaults standardUserDefaults] stringForKey:kuser_token];
    kUser.user_id =      [[NSUserDefaults standardUserDefaults] stringForKey:kuser_id];
    kUser.money =   [[NSUserDefaults standardUserDefaults] stringForKey:kuser_money];
    kUser.mobile =       [[NSUserDefaults standardUserDefaults] stringForKey:kMobile];
    kUser.nickname =    [[NSUserDefaults standardUserDefaults] stringForKey:knick_name];
    kUser.head_pic =     [[NSUserDefaults standardUserDefaults] stringForKey:khead_pic];
    
    
    return kUser.user_token != nil && kUser.user_token.length > 0;
}

- (void)setUser_token:(NSString *)user_token
{
    _user_token = user_token;
    if (nil == user_token)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kuser_token];
    }else{
         [[NSUserDefaults standardUserDefaults] setObject:_user_token forKey:kuser_token];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setMobile:(NSString *)mobile
{
    _mobile = mobile;
    if (nil == mobile)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kMobile];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:_mobile forKey:kMobile];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setUser_id:(NSString *)user_id
{
    _user_id = user_id;
    if (nil == _user_id)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kuser_id];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:_user_id forKey:kuser_id];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setHead_pic:(NSString *)head_pic
{
    _head_pic = head_pic;
    if (nil == head_pic)
    {
          [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:khead_pic];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:_head_pic forKey:khead_pic];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setNickname:(NSString *)nickname
{
    _nickname = nickname;
    if (nil ==nickname) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:knick_name];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:_nickname forKey:knick_name];
    }
     [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setMoney:(NSString *)money
{
    _money = money;
    if (nil == money)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kuser_money];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:money forKey:kuser_money];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setHistory:(NSArray *)history
{
    _history = history;
    if (nil == history) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:khistory];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:history forKey:khistory];
    }
      [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setGoodsHistory:(NSArray *)goodsHistory
{
    _goodsHistory = goodsHistory;
    if (nil == goodsHistory) {
         [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kGoodsHistory];
    }else{
         [[NSUserDefaults standardUserDefaults] setObject:goodsHistory forKey:kGoodsHistory];
    }
      [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

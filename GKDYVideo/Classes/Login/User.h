//
//  User.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
/// 单利
+ (User *)currentUser;
+ (BOOL)isLogin;
@property (strong, nonatomic)NSString * user_token;
@property (strong, nonatomic)NSString * user_id;
@property (strong, nonatomic)NSString * mobile;
@property (strong, nonatomic)NSString * nickname;
@property (strong, nonatomic)NSString * head_pic;
@property (strong, nonatomic)NSString * money;
@property (assign, nonatomic)NSInteger sex;
@property (strong, nonatomic)NSArray *history;

@end

@interface Info : NSObject
@property (strong, nonatomic)NSString * id_pic;
@property (strong, nonatomic)NSString * id_pic_un;
@property (strong, nonatomic)NSString * true_name;
@property (assign, nonatomic)NSInteger id_status;

@end
NS_ASSUME_NONNULL_END


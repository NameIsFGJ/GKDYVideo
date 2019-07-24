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
@property (strong, nonatomic)NSString * nick_name;
@property (strong, nonatomic)NSString * head_pic;
@property (strong, nonatomic)NSString * user_money;
//@property (strong, nonatomic)NSString * city;
//@property (strong, nonatomic)NSString * mf_num;
//@property (assign, nonatomic)NSInteger is_edit;
//@property (strong, nonatomic)NSString * ali_bank;
//@property (assign, nonatomic)NSInteger is_set_paypw;
//@property (strong, nonatomic)NSString * signs;
//@property (assign, nonatomic)float user_money;
//@property (strong, nonatomic)NSDictionary * info;
@end

@interface Info : NSObject
@property (strong, nonatomic)NSString * id_pic;
@property (strong, nonatomic)NSString * id_pic_un;
@property (strong, nonatomic)NSString * true_name;
@property (assign, nonatomic)NSInteger id_status;
@end
NS_ASSUME_NONNULL_END


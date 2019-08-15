//
//  UserModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (assign, nonatomic)NSInteger ide;
@property (strong, nonatomic)NSString *nickname;
@property (strong, nonatomic)NSString *head_pic;
@property (assign, nonatomic)NSInteger sex;
@property (strong, nonatomic)NSString *signs;
@property (strong, nonatomic)NSString *mf_num;
@property (assign, nonatomic)NSInteger guan_num;
@property (assign, nonatomic)NSInteger fans_num;
@property (strong, nonatomic)NSString *status;
@property (strong, nonatomic)NSString *city;
@property (assign, nonatomic)NSInteger is_guan;
@property (assign, nonatomic)NSInteger is_shop;
@property (assign, nonatomic)NSInteger zan_num;

@end

NS_ASSUME_NONNULL_END

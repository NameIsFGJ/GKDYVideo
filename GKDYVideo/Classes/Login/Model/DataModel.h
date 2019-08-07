//
//  DataModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/7.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject
@property (strong, nonatomic)NSString *nickname;
@property (strong, nonatomic)NSString *mobile;

@property (strong, nonatomic)NSString *head_pic;
@property (assign, nonatomic)NSInteger sex;
@property (strong, nonatomic)NSString *birthday;
@property (strong, nonatomic)NSString *signs;

@property (strong, nonatomic)NSString *money;
@property (strong, nonatomic)NSString *mf_num;
@property (assign, nonatomic)NSInteger is_edit;

@property (assign, nonatomic)NSInteger ali_bank;
@property (strong, nonatomic)NSString *city;
@property (strong, nonatomic)NSString *token;
@property (strong, nonatomic)NSString *user_id;

@end

NS_ASSUME_NONNULL_END

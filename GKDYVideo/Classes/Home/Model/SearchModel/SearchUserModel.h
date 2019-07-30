//
//  SearchUserModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchUserData : NSObject
@property(assign, nonatomic)NSInteger user_id;
@property(assign, nonatomic)NSInteger sex;
@property(strong, nonatomic)NSString * nickname;
@property(strong, nonatomic)NSString * head_pic;
@property(strong, nonatomic)NSString * mf_num;
@property(assign, nonatomic)NSInteger is_guan;

@end

@interface SearchUserModel : BaseModel
@property (strong, nonatomic)SearchUserData *data;
@end

NS_ASSUME_NONNULL_END

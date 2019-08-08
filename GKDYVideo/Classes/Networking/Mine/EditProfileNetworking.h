//
//  EditProfileNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "NewBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditProfileNetworking : BaseNetworking
+(void)postEditProfile:(NSString *)token   withKey:(NSString *)key WithValue:(NSString *)value completion:(void(^)(NewBaseModel *model,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

//
//  UserNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "UserModel.h"
NS_ASSUME_NONNULL_BEGIN
//+ (void)postVideoGuanWithUserID:(NSString *)token withPage:(NSInteger)page completion:(void(^)(NSArray *array,NSError *error))completionHandle;
@interface UserNetworking : BaseNetworking

+ (void)postVideoGuanWithUserID:(NSString *)token withUserID:(NSInteger)userID completion:(void(^)(UserModel *model,NSError *error))completionHandle;

@end

NS_ASSUME_NONNULL_END

//
//  UpLoadAvatarNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "UploadAvatarModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface UpLoadAvatarNetworking : BaseNetworking
+(void)postUploadAvatarWithToken:(NSString *)token
                      withAvator:(UIImage *)avatar
                      completion:(void(^)(NSInteger code,NSError *error))completionHandle;

@end

NS_ASSUME_NONNULL_END

//
//  UploadVideoNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/3.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface UploadVideoNetworking : BaseNetworking
+ (void)postUploadVideoWithToken:(NSString *)token
                    withVideoUrl:(NSString *)videoUrl
                       withTitle:(NSString *)title
                     complection:(void(^)(NSString *msg,NSError *error))completionHandle;


@end

NS_ASSUME_NONNULL_END

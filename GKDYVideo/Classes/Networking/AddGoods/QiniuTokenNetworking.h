//
//  QiniuTokenNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/3.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface QiniuTokenNetworking : BaseNetworking
+(void)postQiniuTokenNetworkingCompletion:(void(^)(NSDictionary *dic,NSError *error))completionHandle;

@end

NS_ASSUME_NONNULL_END

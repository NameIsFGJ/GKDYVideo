//
//  VideoGuanNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoGuanNetworking : BaseNetworking
+ (void)postVideoGuanWithUserID:(NSInteger)userID withPage:(NSInteger)page completion:(void(^)(NSArray *array,NSError *error))completionHandle;

@end

NS_ASSUME_NONNULL_END

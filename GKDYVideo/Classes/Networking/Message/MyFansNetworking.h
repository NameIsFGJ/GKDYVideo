//
//  MyFansNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyFansNetworking : BaseNetworking
+ (void)postMyFans:(NSString *)userToken
        withUserID:(NSInteger)user_id
          withPage:(NSInteger)page
        completion:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

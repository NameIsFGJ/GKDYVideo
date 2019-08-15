//
//  SearchUsersNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchUsersNetworking : BaseNetworking
+ (void)postSearchUsers:(NSInteger)page
               keyworld: (NSString *)keyworld
                token:(NSString *)token
       completionHandle:(void(^)(NSMutableArray *modelArray,NSError *error))complectionHandle;

@end

NS_ASSUME_NONNULL_END

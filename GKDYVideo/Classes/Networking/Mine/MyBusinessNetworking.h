//
//  MyBusinessNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBusinessNetworking : BaseNetworking
+ (void)postMyBusinessWithToken:(NSString *)token
                       withPage:(NSInteger)page
                       withType:(NSInteger)type
                     completion:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

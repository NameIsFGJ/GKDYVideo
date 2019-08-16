//
//  UserVideoNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "SearchVideoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserVideoNetworking : BaseNetworking
+ (void)postSomeBodyVideo:(NSString *)token
                 withType:(NSInteger)type
                 withPage:(NSInteger)page
                 withUserID:(NSInteger)userID
                 complection:(void(^)(NSArray *array,NSError *error))complectionHandle;
@end

NS_ASSUME_NONNULL_END

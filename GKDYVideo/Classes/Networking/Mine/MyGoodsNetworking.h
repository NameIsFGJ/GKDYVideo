//
//  MyGoodsNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyGoodsNetworking : BaseNetworking
+ (void)postIssueMyGoodsWithToken:(NSString *)token
                         withPage:(NSInteger)page
                       completion:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

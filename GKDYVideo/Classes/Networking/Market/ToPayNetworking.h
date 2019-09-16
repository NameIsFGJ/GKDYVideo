//
//  ToPayNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToPayNetworking : BaseNetworking
+ (void)postToPayWithToken:(NSString *)token
                completion:(void(^)(NSDictionary *dic,NSError *eror))completionHandle;
@end

NS_ASSUME_NONNULL_END

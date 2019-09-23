//
//  ToPayDataNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/20.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToPayDataNetworking : NSObject

+ (void)PostToPaySuccessNetworkingWithToken:(NSString *)token
                            withOrderAmount:(NSString *)amount
                                withOrderSn:(NSString *)orderSn
                                withPayType:(NSString *)payType
                                 completion:(void(^)(NSString * data,NSError *error))completionHandle;

@end

NS_ASSUME_NONNULL_END

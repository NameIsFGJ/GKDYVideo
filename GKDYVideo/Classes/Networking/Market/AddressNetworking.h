//
//  AddressNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressNetworking : BaseNetworking
+(void)postAddressListWithToken:(NSString *)token withPage:(NSInteger)page completion:(void(^)(NSArray *array,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

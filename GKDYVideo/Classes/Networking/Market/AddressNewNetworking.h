//
//  AddressNewNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/9.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressNewNetworking : BaseNetworking

//+(void)postAddressListWithToken:(NSString *)token withPage:(NSInteger)page completion:(void(^)(NSMutableArray *array,NSError *error))completionHandle;

+ (void)postAddressNewWithToken:(NSString *)token withConsignee:(NSString *)consignee withMobile:(NSString *)mobile withCity:(NSString *)city withAddress:(NSString *)address withZipCode:(NSString *)zipCode completion:(void(^)(NSInteger  code,NSError*error))completionHanle;

@end

NS_ASSUME_NONNULL_END

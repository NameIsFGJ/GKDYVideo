//
//  AddressEditNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressEditNetworking : BaseNetworking
+ (void)postAddressEditWithToken:(NSString *)token
          withAddressID:(NSInteger )addressID
          withConsignee:(NSString *)consignee
             withMobile:(NSString *)mobile
               withCity:(NSString *)city
            withAddress:(NSString *)address
            withZipCode:(NSString *)zipCode
             completion:(void(^)(NSInteger code,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

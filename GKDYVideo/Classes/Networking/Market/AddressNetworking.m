//
//  AddressNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressNetworking.h"

@implementation AddressNetworking
+(void)postAddressListWithToken:(NSString *)token withPage:(NSInteger)page completion:(void(^)(NSArray *array,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/addressList"];
    NSDictionary *para = @{@"token":token,@"page":@(page)};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([[responseObj objectForKey:@"code"] integerValue] == 1) {
            NSArray *array = responseObj[@"data"][@"rows"];
            completionHandle(array,nil);
        }else{
            completionHandle(nil,error);
        }
    }];
}

@end

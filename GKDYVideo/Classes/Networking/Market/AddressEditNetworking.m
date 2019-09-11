//
//  AddressEditNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressEditNetworking.h"

@implementation AddressEditNetworking
+ (void)postAddressEditWithToken:(NSString *)token
          withAddressID:(NSInteger)addressID
          withConsignee:(NSString *)consignee
             withMobile:(NSString *)mobile
               withCity:(NSString *)city
            withAddress:(NSString *)address
            withZipCode:(NSString *)zipCode
             completion:(void(^)(NSInteger code,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/addressEdit"];
    NSDictionary *para = @{@"token":token,
                           @"address_id":@(addressID),
                           @"consignee":consignee,
                      @"mobile":mobile,
                           @"city":city,
                           @"address":address,
                           @"zipcode":zipCode};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"responseOb333j  =%@",responseObj);
        NSInteger code = [[responseObj objectForKey:@"code"] integerValue];
        if (code == 1){
            
            completionHandle(code, nil);
        }else
        {
            //completionHandle(nil,error);
        }
    }];
    
}
@end

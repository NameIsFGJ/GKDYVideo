//
//  AddressNewNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/9.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressNewNetworking.h"

@implementation AddressNewNetworking
+ (void)postAddressNewWithToken:(NSString *)token withConsignee:(NSString *)consignee withMobile:(NSString *)mobile withCity:(NSString *)city withAddress:(NSString *)address withZipCode:(NSString *)zipCode completion:(void(^)(NSInteger  code,NSError*error))completionHanle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/addressNew"];
    NSDictionary *para = @{
                           @"token":token,
                           @"consignee":consignee,
                           @"mobile":mobile,
                           @"city":city,
                           @"address":address,
                           @"zipcode":zipCode
                           
                           };
    
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"respons34eObj  =%@",responseObj);
        NSInteger code = [responseObj[@"code"] integerValue];
        if (code == 1) {
            [self showSuccessMsg:@"新增成功"];
            completionHanle(code,nil);
        }else
        {
            [self showSuccessMsg:@"新增失败,请重新编辑"];
            completionHanle(nil,error);
        }
    }];
}

@end

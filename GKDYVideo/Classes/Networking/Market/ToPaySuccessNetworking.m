//
//  ToPaySuccessNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/17.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ToPaySuccessNetworking.h"

@implementation ToPaySuccessNetworking
+ (void)PostToPaySuccessNetworkingWithToken:(NSString *)token
                            withOrderAmount:(NSString *)amount
                                withOrderSn:(NSString *)orderSn
                                withPayType:(NSString *)payType
                                 completion:(void(^)(NSString * data,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/order/toPay"];
    NSDictionary *para = @{@"token":token,@"order_amount":amount,@"order_sn":orderSn,@"pay_type":payType};
    NSLog(@"para  34=%@",para);
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
    
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"respo34nseObj  =%@",responseObj);
        NSLog(@"err11or  =%@",error);
        if ([responseObj[@"code"] integerValue] == 1) {
            NSString *data = responseObj[@"data"];
            completionHandle(data,nil);
        }
    }];
}

@end

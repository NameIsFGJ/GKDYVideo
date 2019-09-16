//
//  ToPayNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ToPayNetworking.h"

@implementation ToPayNetworking
+ (void)postToPayWithToken:(NSString *)token
                completion:(void(^)(NSDictionary *dic,NSError *eror))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/order/payMess"];
    NSDictionary *para = @{@"token":token};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([responseObj[@"code"] integerValue] == 1) {
            completionHandle(responseObj[@"data"],nil);
        }
    }];
}

@end

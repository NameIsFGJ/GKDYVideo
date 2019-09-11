//
//  AddressDefaultNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressDefaultNetworking.h"

@implementation AddressDefaultNetworking
+(void)postAddressDefaultWithToken:(NSString *)token
                     withAddressID:(NSInteger)addressID
                        completion:(void(^)(NSInteger code,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/addressDefault"];
    NSDictionary *para = @{@"token":token,@"address_id":@(addressID)};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
     
        NSInteger code = [[responseObj objectForKey:@"code"]integerValue];
        
        NSLog(@"responseObj34  =%@",responseObj);
        completionHandle(code,nil);
//        if (code == 1) {
//
//        }else{
//            completionHandle(nil,error);
//        }
    }];
}

@end

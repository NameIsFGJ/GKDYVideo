//
//  LoginNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "LoginNetworking.h"

@implementation LoginNetworking
+ (void)postLogin:(NSString *)mobile
       codeNumber:(NSString *)code
 completionHandle:(void(^)(LoginBaseModel *model,NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/login"];
    NSDictionary *parameters = @{@"user_mobile":mobile,@"code":code};
    [self POST:urlStr
    parameters:parameters
      progress:^(NSProgress * _Nonnull progress)
    {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error)
    {
        if (!error)
        {
            complectionhandle([LoginBaseModel yy_modelWithDictionary:responseObj],nil);
        }
    }];
}

@end

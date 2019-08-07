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
 completionHandle:(void(^)(DataModel *model,NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/mobilelogin"];
    NSDictionary *parameters = @{@"mobile":mobile,@"captcha":code};
    [self POST:urlStr
    parameters:parameters
      progress:^(NSProgress * _Nonnull progress)
    {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error)
    {
       NSLog(@"respons333eObj  =%@",responseObj);
        if (!error)
        {
            complectionhandle([DataModel yy_modelWithDictionary:responseObj],nil);
        }
    }];
}

@end

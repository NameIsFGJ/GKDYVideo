//
//  SendRegisterCodeNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SendRegisterCodeNetworking.h"

@implementation SendRegisterCodeNetworking
+(void)postSendRegisterCode:(NSString *)phone
                 completion:(void(^)(BaseModel *model,NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/sendaliyundayusms"];
    NSDictionary *parameters = @{@"user_mobile":phone};
    [self POST:urlStr
    parameters:parameters
      progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"responseObj  =%@",responseObj);
        complectionhandle([BaseModel yy_modelWithDictionary:responseObj],error);
    }];
}
@end

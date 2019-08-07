//
//  SendRegisterCodeNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SendRegisterCodeNetworking.h"

@implementation SendRegisterCodeNetworking
+(void)postSendRegisterCode:(NSString *)phone withScene:(NSString *)sceneType
                 completion:(void(^)(BaseModel *model,NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/sendCaptcha"];
    NSDictionary *parameters = @{@"mobile":phone,@"scene":sceneType};
    [self POST:urlStr
    parameters:parameters
      progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
            NSLog(@"respo34nseObj  =%@",responseObj);
        complectionhandle([BaseModel yy_modelWithDictionary:responseObj],error);
    }];
}

@end

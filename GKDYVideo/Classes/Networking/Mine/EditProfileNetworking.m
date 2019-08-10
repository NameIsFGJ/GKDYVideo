//
//  EditProfileNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "EditProfileNetworking.h"

@implementation EditProfileNetworking
+(void)postEditProfile:(NSString *)token   withKey:(NSString *)key WithValue:(NSString *)value completion:(void(^)(NewBaseModel *model,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/editProfile"];
    NSDictionary *para = @{@"token":kUser.user_token,key:value};
    
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"responseObj  =%@",responseObj);
             completionHandle([NewBaseModel yy_modelWithDictionary:responseObj],nil);
        }else{
             completionHandle(nil,error);
        }
    }];
}


@end

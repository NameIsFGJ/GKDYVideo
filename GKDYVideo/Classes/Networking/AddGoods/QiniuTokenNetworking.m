//
//  QiniuTokenNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/3.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "QiniuTokenNetworking.h"

@implementation QiniuTokenNetworking
+(void)postQiniuTokenNetworkingCompletion:(void(^)(NSDictionary *dic,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/qiniu"];
    NSDictionary *para = @{@"token":kUser.user_token};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ( [responseObj[@"code"]integerValue] == 1) {
            NSDictionary *dic = responseObj[@"data"];
            completionHandle(dic,nil);
        }
    }];
}

@end

//
//  UploadVideoNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/3.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UploadVideoNetworking.h"

@implementation UploadVideoNetworking
+ (void)postUploadVideoWithToken:(NSString *)token
                    withVideoUrl:(NSString *)videoUrl
                       withTitle:(NSString *)title
                     complection:(void(^)(NSString *msg,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/uploadVideo"];
    NSDictionary *para = @{@"token":token,@"video_url":videoUrl,@"title":title};
    NSLog(@"para34  =%@",para);
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([[responseObj objectForKey:@"code"] integerValue] == 1) {
            NSString * msg = [responseObj objectForKey:@"msg"];
            completionHandle(msg,nil);
        }
    }];
}

@end

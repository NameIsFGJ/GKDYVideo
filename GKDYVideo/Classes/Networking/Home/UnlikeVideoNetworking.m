//
//  UnlikeVideoNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UnlikeVideoNetworking.h"

@implementation UnlikeVideoNetworking
+ (void)postUnLikeVideo:(NSString *)token
                 userID:(NSNumber *)uid
                videoID:(NSNumber *)vid
       completionHandle:(void(^)(LikeVideoModel *model, NSError *error))complectionhandle;{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/unlikeVideo"];
    NSDictionary *dic = @{@"user_token":token,@"user_id":uid,@"v_id":vid};
    [self POST:urlStr parameters:dic progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([responseObj[@"error_msg"] isEqualToString:@"success"]) {
            NSDictionary *dic = responseObj[@"data"];
            complectionhandle([LikeVideoModel yy_modelWithDictionary:dic],nil);
        }else{
            complectionhandle(nil,error);
        }
    }];
}

@end

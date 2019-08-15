//
//  UnflollowingNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UnflollowingNetworking.h"

@implementation UnflollowingNetworking
+ (void)postUnFlollowing:(NSString *)token
                 toUseID:(NSNumber *)tuid
        completionHandle:(void(^)(LikeVideoModel *model, NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/following"];
    NSDictionary *dic = @{@"user_token":token,@"to_user_id":tuid};
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

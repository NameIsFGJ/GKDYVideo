//
//  FlollowingNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "FlollowingNetworking.h"

@implementation FlollowingNetworking
+ (void)postFlollowing:(NSString *)token
             fromUseID:(NSNumber *)fuid
               toUseID:(NSNumber *)tuid
      completionHandle:(void(^)(LikeVideoModel *model, NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/following"];
    NSDictionary *dic = @{@"user_token":token,@"from_user_id":fuid,@"to_user_id":tuid};
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

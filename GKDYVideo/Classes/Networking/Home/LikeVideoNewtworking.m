//
//  LikeVideoNewtworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "LikeVideoNewtworking.h"

@implementation LikeVideoNewtworking
+ (void)postLikeVideo:(NSString *)token
              videoID:(NSInteger )vid
     completionHandle:(void(^)(NewBaseModel *model, NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/likeVideo"];
    NSDictionary *dic = @{@"token":token,@"v_id":@(vid)};
    [self POST:urlStr parameters:dic progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        
        complectionhandle([NewBaseModel yy_modelWithDictionary:responseObj],nil);
//        if ([responseObj[@"error_msg"] isEqualToString:@"success"]) {
//            NSDictionary *dic = responseObj[@"data"];
//            complectionhandle([NewBaseModel yy_modelWithDictionary:dic],nil);
//        }else{
//            complectionhandle(nil,error);
//        }
    }];
    
}
@end

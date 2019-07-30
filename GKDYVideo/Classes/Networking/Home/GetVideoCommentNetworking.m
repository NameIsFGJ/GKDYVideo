//
//  GetVideoCommentNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/25.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GetVideoCommentNetworking.h"

@implementation GetVideoCommentNetworking
+(void)postGetVideoComment:(NSInteger )nowpage userID:(NSInteger)user_id videoID:(NSInteger)video_id completion:(void(^)(GetVideoCommentModel *model,NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/getVideoComment"];
    NSDictionary *parame = @{@"nowpage":@(1),@"user_id":@(user_id),@"video_id":@(video_id)};
    [self POST:urlStr parameters:parame progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        
        if ([[responseObj objectForKey:@"error_msg"]isEqualToString:@"success"])
        {
            NSDictionary *dic = [responseObj objectForKey:@"data"];
            complectionhandle([GetVideoCommentModel yy_modelWithDictionary:dic],nil);
        }else{
            complectionhandle(nil,error);
        }
        
        
    }];
}
@end

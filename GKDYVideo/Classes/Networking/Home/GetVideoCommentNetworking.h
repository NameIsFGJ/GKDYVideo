//
//  GetVideoCommentNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/25.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "GetVideoCommentModel.h"

NS_ASSUME_NONNULL_BEGIN
// completionHandle:(void(^)(LikeVideoModel *model, NSError *error))complectionhandle;
@interface GetVideoCommentNetworking : BaseNetworking
+(void)postGetVideoComment:(NSInteger )nowpage userID:(NSInteger)user_id videoID:(NSInteger)video_id completion:(void(^)(GetVideoCommentModel *model,NSError *error))complectionhandle;

@end

NS_ASSUME_NONNULL_END

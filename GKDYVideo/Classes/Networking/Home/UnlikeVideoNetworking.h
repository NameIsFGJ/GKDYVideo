//
//  UnlikeVideoNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "LikeVideoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface UnlikeVideoNetworking : BaseNetworking
+ (void)postUnLikeVideo:(NSString *)token
                 userID:(NSInteger )uid
                videoID:(NSInteger )vid
       completionHandle:(void(^)(LikeVideoModel *model, NSError *error))complectionhandle;
@end

NS_ASSUME_NONNULL_END

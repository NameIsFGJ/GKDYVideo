//
//  FlollowingNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "NewBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlollowingNetworking : BaseNetworking
+ (void)postFlollowing:(NSString *)token
               toUseID:(NSInteger )tuid
      completionHandle:(void(^)(NewBaseModel *model, NSError *error))complectionhandle;
@end

NS_ASSUME_NONNULL_END

//
//  SearchVideosNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchVideosNetworking : BaseNetworking
+ (void)postSearchVideoWithPage:(NSInteger)page
                        keyword:(NSString *)keyword
                         token:(NSString * )token
                     completion:(void(^)(NSMutableArray *modelArray,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

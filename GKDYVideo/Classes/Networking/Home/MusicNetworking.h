//
//  MusicNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "MusicModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MusicNetworking : BaseNetworking
+ (void)postMusicNetworking:(NSString *)token complection:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

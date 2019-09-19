//
//  TestUploadNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
@class AddGoodsInfoModel;
NS_ASSUME_NONNULL_BEGIN

@interface TestUploadNetworking : BaseNetworking
+ (void)postUpLoadWithToken:(AddGoodsInfoModel *)model completion:(void(^)(NSString *msg,NSError *error))completionHandle;



@end

NS_ASSUME_NONNULL_END

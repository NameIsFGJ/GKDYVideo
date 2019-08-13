//
//  IdCardUploadNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "NewBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface IdCardUploadNetworking : BaseNetworking
+ (void)postIdCardUpLoad:(NSString *)token withTrueName:(NSString *)name withIDCard:(NSInteger)cardNumber withPic:(UIImage *)pic withPicUn:(UIImage *)picUn completion:(void(^)(NewBaseModel *model,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END

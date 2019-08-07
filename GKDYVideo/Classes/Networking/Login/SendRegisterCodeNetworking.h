//
//  SendRegisterCodeNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "BaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SendRegisterCodeNetworking : BaseNetworking
+(void)postSendRegisterCode:(NSString *)phone withScene:(NSString *)sceneType completion:(void(^)(BaseModel *model,NSError *error))complectionhandle;
@end

NS_ASSUME_NONNULL_END

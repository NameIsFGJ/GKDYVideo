//
//  LoginNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "DataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginNetworking : BaseNetworking

+ (void)postLogin:(NSString *)mobile
       codeNumber:(NSString *)code
 completionHandle:(void(^)(DataModel *model,NSError *error))complectionhandle;

@end

NS_ASSUME_NONNULL_END

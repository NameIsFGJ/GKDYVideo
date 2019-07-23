//
//  MyIndexNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "User.h"
#import "BaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyIndexNetworking : BaseNetworking
//+ (void)postMyIndex:()
+ (void)postMyIndex:(NSString *)token
               userID:(NSNumber *)uid
     completionHandle:(void(^)(BaseModel *model, NSError *error))complectionhandle;

@end

NS_ASSUME_NONNULL_END

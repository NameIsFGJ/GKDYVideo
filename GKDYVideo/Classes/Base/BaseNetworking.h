//
//  BaseNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNetworking : NSObject
+ (id _Nullable )GET:(NSString *_Nonnull)path parameters:(NSDictionary *_Nullable)params progress:(void (^_Nullable)(NSProgress * _Nonnull progress))downloadProgress completionHandler:(void(^_Nullable)(id _Nullable responseObj, NSError * _Nullable error))complete;
/** 对AFHTTPSessionManager的POST请求方法进行了封装 */
+ (id _Nullable )POST:(NSString *_Nonnull)path parameters:(NSDictionary *_Nullable)params progress:(void (^_Nullable)(NSProgress * _Nonnull progress))uploadProgress completionHandler:(void(^_Nullable)(id _Nullable responseObj, NSError * _Nullable error))complete;
@end

NS_ASSUME_NONNULL_END

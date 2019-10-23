//
//  BaseNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
static AFHTTPSessionManager *manager = nil;
@implementation BaseNetworking
+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AFHTTPSessionManager manager];
  manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", @"charset=utf-8", nil];
       
    });
    return manager;
}

+ (id _Nullable )GET:(NSString *_Nonnull)path
          parameters:(NSDictionary *_Nullable)params
            progress:(void (^_Nullable)(NSProgress * _Nonnull progress))downloadProgress
   completionHandler:(void(^_Nullable)(id _Nullable responseObj, NSError * _Nullable error))complete
{

    return [[self sharedAFManager] GET:path
                            parameters:[self configParameters:params]
                              progress:^(NSProgress * _Nonnull downloadprogress) {
                                  downloadProgress(downloadprogress);
                              } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                  NSDictionary *response = (NSDictionary *)responseObject;
                           
                                  NSError *error = [self errorWithResponse:response];
                                  if (error)
                                  {
                                      complete(nil, error);
                                  }
                                  else
                                  {
                                      complete(response, nil);
                                  }
                              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

                                  complete(nil, error);
                              }];
}

+ (id _Nullable )POST:(NSString *_Nonnull)path
           parameters:(NSDictionary *_Nullable)params
             progress:(void (^_Nullable)(NSProgress * _Nonnull progress))uploadProgress
    completionHandler:(void(^_Nullable)(id _Nullable responseObj, NSError * _Nullable error))complete
{

    return [[self sharedAFManager] POST:path
                             parameters:[self configParameters:params]
                               progress:^(NSProgress * _Nonnull uploadprogress) {
                                   uploadProgress(uploadprogress);
                               } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                   NSDictionary *response = (NSDictionary *)responseObject;
                                   
                                   //       NSLog(@"\n█ ▉ ▇ ▆ ▅ ▄ ▃ ▂ Response Path : %@\n data : \n %@\n", path, [self logDic:response]);
                                   NSError *error = [self errorWithResponse:response];
                                   if (error)
                                   {
                                       complete(nil, error);
                                   }
                                   else
                                   {
                                       complete(response, nil);
                                   }
                               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                   
                                   NSLog(@"\n█ ▉ ▇ ▆ ▅ ▄ ▃ ▂ Response Path : %@\n data : \n %@\n", path, error.domain);
                                 
                                   complete(nil, error);
                               }];
}

+ (NSDictionary *)configParameters:(NSDictionary *)params
{
    NSMutableDictionary * paramDatas = [NSMutableDictionary dictionaryWithDictionary:params];
  
    return paramDatas;
}

+ (NSError *)errorWithResponse:(NSDictionary *)response
{
    NSString * result = [response objectForKey:@"error_msg"];
    if ([result isEqualToString:@"success"])
    {
        return nil;
    }
    else
    {

        NSError *error;

        return error;
    }
}


@end

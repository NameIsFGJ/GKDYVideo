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
    //打印网络请求， DDLog  与  NSLog 功能一样
    //    [[self sharedAFManager].requestSerializer setValue:mWugt.token forHTTPHeaderField:@"Http-X-User-Access-Token"];
    //DDLogVerbose(@"\n▂ ▃ ▄ ▅ ▆ ▇ █ ▉ Request Path: %@,\n params %@\n", path, params);
    return [[self sharedAFManager] GET:path
                            parameters:[self configParameters:params]
                              progress:^(NSProgress * _Nonnull downloadprogress) {
                                  downloadProgress(downloadprogress);
                              } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                  NSDictionary *response = (NSDictionary *)responseObject;
                                  //  DDLogVerbose(@"\n█ ▉ ▇ ▆ ▅ ▄ ▃ ▂ Response Path : %@\n data : \n %@\n", path, [self logDic:response]);
                                  //#warning @YZC
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
                                  //   DDLogVerbose(@"\n█ ▉ ▇ ▆ ▅ ▄ ▃ ▂ Response Path : %@\n data : \n %@\n", path, error.domain);
                                  //                                  [self handleError:error];
                                  //   error = [self errorWithReachabilityStatusWithError:error] ? : error;
                                  complete(nil, error);
                              }];
}

+ (id _Nullable )POST:(NSString *_Nonnull)path
           parameters:(NSDictionary *_Nullable)params
             progress:(void (^_Nullable)(NSProgress * _Nonnull progress))uploadProgress
    completionHandler:(void(^_Nullable)(id _Nullable responseObj, NSError * _Nullable error))complete
{
    
    //  DDLogVerbose(@"\n▂ ▃ ▄ ▅ ▆ ▇ █ ▉ Request Path: %@\n params: \n %@\n", path, params);
    // [[self sharedAFManager].requestSerializer setValue:mWugt.token forHTTPHeaderField:@"Http-X-User-Access-Token"];
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
                                   //                                   [self handleError:error];
                                   //  error = [self errorWithReachabilityStatusWithError:error] ? : error;
                                   complete(nil, error);
                               }];
}

+ (NSDictionary *)configParameters:(NSDictionary *)params
{
    NSMutableDictionary * paramDatas = [NSMutableDictionary dictionaryWithDictionary:params];
    //    [paramDatas setObject:@"appstore" forKey:@"dc"];
    //    [paramDatas setObject:@"iphone" forKey:@"dt"];
    //    [paramDatas setObject:k_IDFA_string forKey:@"di"];
    //    [paramDatas setObject:kVersionShortString forKey:@"av"];
    //    [paramDatas setObject:kVersionShortString forKey:@"iv"];
    //    [paramDatas setObject:kVersionLongString forKey:@"fv"];
    //    [paramDatas setObject:@"zzlc" forKey:@"at"];
    //    [paramDatas setObject:[self signWithParameters:paramDatas] forKey:@"signature"];
    return paramDatas;
}

//+ (NSString *)signWithParameters:(NSDictionary *)params
//{
//
//    NSArray * paramsKeys = [params allKeys];
//    NSArray * sortedParamsKeys = [paramsKeys sortedArrayUsingSelector:@selector(compare:)];
//    NSString *rawvkey = @"";
//    for (NSString * key in sortedParamsKeys)
//    {
//        rawvkey = [NSString stringWithFormat:@"%@%@=%@&",rawvkey,key, params[key]];
//    }
//    if ([sortedParamsKeys count])
//    {
//        rawvkey = [rawvkey substringToIndex:rawvkey.length-1];
//    }
//  //  NSString * sign = [[NSString stringWithFormat:@"%@%@", rawvkey, kSkey] MD5];
// //   return sign;
//}

+ (NSError *)errorWithResponse:(NSDictionary *)response
{
    NSString * result = [response objectForKey:@"error_msg"];
    if ([result isEqualToString:@"success"])
    {
        return nil;
    }
    else
    {
//        if ([(NSString *)response[@"code"] isEqualToString:@"needLogin"])
//        {
//            //            mWugt.token = @"";
//            //            mWugt.mobile = @"";
//            //            mWugt.memberID = @"";
//            //            mWugt.userName = @"";
//            //            // mWugt.gestureCipher = @"";
//            //            [self postCustomNotificationName:@"LoginOrLogout" object:nil];
//        }
        NSError *error;
//       NSError *error = [NSError errorWithDomain:[(NSString *)response[@"message"] length] == 0 ?
//                          @"网络请求出错请重试" : response[@"message"]
//                                             code:[(NSString *)response[@"code"] length] == 0 ?
//                          9999 : [(NSNumber *)response[@"code"] integerValue]
//                                         userInfo:response];
        return error;
    }
}

//+ (NSError *)errorWithReachabilityStatusWithError:(NSError *)error
//{
//    Reachability *r = [Reachability reachabilityWithHostname:@"http://www.baidu.com"];
//    if ([r currentReachabilityStatus] == NotReachable)
//    {
//        NSError *error = [NSError errorWithDomain:@"请检查您的网络哦"
//                                             code:404
//                                         userInfo:nil];
//        return error;
//    }
//    if ([error.domain hasPrefix:@"NS"])
//    {
//        NSError *error = [NSError errorWithDomain:@""
//                                             code:-1001
//                                         userInfo:nil];
//        return error;
//    }
//    return nil;
//}
//
//+ (NSString *)logDic:(NSDictionary *)dic
//{
//    if (![dic count])
//    {
//        return nil;
//    }
//    NSString *tempStr1 =
//    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
//                                                 withString:@"\\U"];
//    NSString *tempStr2 =
//    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
//    NSString *tempStr3 =
//    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
//    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *str = [NSPropertyListSerialization propertyListWithData:tempData
//                                                              options:NSPropertyListImmutable
//                                                               format:NULL
//                                                                error:NULL];
//    return str;
//}
//
//
//+ (NSString *)replacingNewLineAndWhitespaceCharactersFromJson:(NSString *)dataStr
//{
//    NSScanner *scanner = [[NSScanner alloc] initWithString:dataStr];
//    [scanner setCharactersToBeSkipped:nil];
//    NSMutableString *result = [[NSMutableString alloc] init];
//
//    NSString *temp;
//    NSCharacterSet*newLineAndWhitespaceCharacters = [ NSCharacterSet newlineCharacterSet];
//    // 扫描
//    while (![scanner isAtEnd])
//    {
//        temp = nil;
//        [scanner scanUpToCharactersFromSet:newLineAndWhitespaceCharacters intoString:&temp];
//        if (temp) [result appendString:temp];
//
//        // 替换换行符
//        if ([scanner scanCharactersFromSet:newLineAndWhitespaceCharacters intoString:NULL]) {
//            if (result.length > 0 && ![scanner isAtEnd]) // Dont append space to beginning or end of result
//                [result appendString:@"|"];
//        }
//    }
//    return result;
//}
@end

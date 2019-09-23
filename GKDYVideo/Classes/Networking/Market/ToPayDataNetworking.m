//
//  ToPayDataNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/20.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ToPayDataNetworking.h"
@implementation ToPayDataNetworking

+ (void)PostToPaySuccessNetworkingWithToken:(NSString *)token
                            withOrderAmount:(NSString *)amount
                                withOrderSn:(NSString *)orderSn
                                withPayType:(NSString *)payType
                                 completion:(void(^)(NSString * data,NSError *error))completionHandle;
{
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc]init];
    securityPolicy.validatesDomainName = NO;
    securityPolicy.allowInvalidCertificates = YES;

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", @"charset=utf-8", nil];
   [manager setSecurityPolicy:securityPolicy];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/order/toPay"];
    NSDictionary *para = @{@"token":token,@"order_amount":amount,@"order_sn":orderSn,@"pay_type":payType};
    NSLog(@"urlStr  =%@",urlStr);
    NSLog(@"para  =%@",para);
    [manager POST:urlStr parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
      //  NSLog(@"responseObj333ect  =%@",responseObject);
        NSString * str  =[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"str。=%@",str);
        
      //  completionHandle(str,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"er111ror  =%@",error);
    }];
}


@end

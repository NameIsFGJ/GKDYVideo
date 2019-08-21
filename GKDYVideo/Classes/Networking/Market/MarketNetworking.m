//
//  MarketNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketNetworking.h"

@implementation MarketNetworking
+(void)postIndexWithCompletion:(void(^)(MarketModel *model,NSError *error))completionHanle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/goods/index"];
    [self POST:urlStr parameters:nil progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([[responseObj objectForKey:@"code"] integerValue] == 1) {
            NSDictionary *dic = [responseObj objectForKey:@"data"];
            completionHanle([MarketModel yy_modelWithDictionary:dic],nil);
        }
    }];
    
    
}

@end

//
//  GoodsDetailNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GoodsDetailNetworking.h"

@implementation GoodsDetailNetworking
+ (void)postGoodsDetailWithGoodsID:(NSInteger)goodsID completion:(void(^)(NSDictionary *dic,NSError *error))completionHandler;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/goods/goodsDetail"];
    NSDictionary *para = @{@"goods_id":@(goodsID)};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([[responseObj objectForKey:@"code"] integerValue] == 1) {
            NSDictionary *data = responseObj[@"data"];
            completionHandler(data,nil);
        }else{
            completionHandler(nil,error);
        }
    }];
}

@end

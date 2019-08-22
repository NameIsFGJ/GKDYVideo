//
//  MarketSearchGoodsNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketSearchGoodsNetworking.h"

@implementation MarketSearchGoodsNetworking
+ (void)postSearchGoodsWithKeyword:(NSString *)keyword
                          withPage:(NSInteger)page
                          withSale:(NSInteger)sale
                         withPrice:(NSInteger)price complection:(void(^)(MarketUserShopModel *model,NSError *error))complectionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/goods/searchGoods"];
     NSDictionary *para = @{@"page":@(page),@"keyword":@"商品",@"sale":@(sale),@"price":@(price)};
    //NSDictionary *para = @{@"keyword":keyword,@"page":@(page),@"sale":@(sale),@"price":@(price)};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
    
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"respons111eO34bj。=%@",responseObj);
        if ([[responseObj objectForKey:@"code"] integerValue] == 1) {
            NSDictionary *dic = [responseObj objectForKey:@"data"];
            complectionHandle([MarketUserShopModel yy_modelWithDictionary:dic],nil);
        }
    }];
}

@end

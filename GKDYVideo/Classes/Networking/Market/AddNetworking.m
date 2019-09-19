//
//  AddNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddNetworking.h"

@implementation AddNetworking

+ (void)postAddWithToken:(NSString *)token
             withGoodsID:(NSInteger)goodsID
             withSalerID:(NSInteger)salerID
           withAddressID:(NSInteger)addressID
         withOrderAmount:(float)orderAmount
          withGoodsPrice:(float)goodsPrice
            withGoodsNum:(NSInteger)goodsNum
              completion:(void(^)(NSDictionary *dataDic,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/order/add"];
    NSDictionary *para = @{@"token":token,
                           @"goods_id":@(goodsID),
                           @"saler_id":@(salerID),
                           @"address_id":@(addressID),
                           @"order_amount":@(orderAmount),
                           @"goods_price":@(goodsPrice),
                           @"goods_num":@(goodsNum)};
    NSLog(@"pa3434333ra  =%@",para);
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"responseObj  =%@",responseObj);
        NSDictionary *data = responseObj[@"data"];
       
        completionHandle(data,nil);
    }];
}

@end

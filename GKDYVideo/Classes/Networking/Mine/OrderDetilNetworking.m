//
//  OrderDetilNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "OrderDetilNetworking.h"
#import "OrderDetailModel.h"

@implementation OrderDetilNetworking
+(void)postOrderDetailNetworkingWithToken:(NSString *)token
                                 withType:(NSInteger)type
                              withOrderID:(NSInteger)orderID
                               completion:(void(^)(NSMutableArray *array,NSError *error))completionHanlde;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/order/orderDetail"];
    NSDictionary *para = @{@"type":@(type),@"token":kUser.user_token,@"order_id":@(orderID)};
    
    NSLog(@"urlS34tr  =%@",urlStr);
    NSLog(@"par11a  =%@",para);
    
    
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([responseObj[@"code"] integerValue] == 1)
        {
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary * dic in responseObj[@"data"]) {
                OrderDetailModel *model = [OrderDetailModel yy_modelWithDictionary:dic];
                [array addObject:model];
            }
            completionHanlde(array,nil);
        }
    }];
}

@end

//
//  DeleGoodsNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "DeleGoodsNetworking.h"

@implementation DeleGoodsNetworking
+ (void)postDeleGoodNetworkingWithToken:(NSString *)token
                         withGoodID:(NSInteger)goodID
                         completion:(void(^)(NSInteger code,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/goods/deleGoods"];
    NSDictionary *para = @{@"token":token,@"goods_id":@(goodID)};
    
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        completionHandle([[responseObj objectForKey:@"code"]integerValue],nil);
    }];
}

@end

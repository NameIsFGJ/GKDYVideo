//
//  MarketUserShopNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketUserShopNetworking.h"
#
@implementation MarketUserShopNetworking
+ (void)postUserShopWithUsrID:(NSInteger)userID
                     withPage:(NSInteger)page
                   completion:(void(^)(MarketUserShopModel *model,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/goods/urShop"];
    NSDictionary *para = @{@"user_id":@(userID),@"page":@(page)};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([[responseObj objectForKey:@"code"] integerValue] == 1) {
            NSDictionary *dic = [responseObj objectForKey:@"data"];
            completionHandle([MarketUserShopModel yy_modelWithDictionary:dic],nil);
        }
    }];
}

@end

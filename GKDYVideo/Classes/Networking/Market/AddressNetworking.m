//
//  AddressNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressNetworking.h"
#import "AddressListModel.h"
@implementation AddressNetworking
+(void)postAddressListWithToken:(NSString *)token withPage:(NSInteger)page completion:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/addressList"];
    NSDictionary *para = @{@"token":token,@"page":@(page)};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([[responseObj objectForKey:@"code"] integerValue] == 1) {
            NSArray *array = responseObj[@"data"][@"rows"];
            NSMutableArray *itemsArray = [NSMutableArray array];
            for (NSDictionary *dic in array) {
                AddressListModel *model = [AddressListModel yy_modelWithDictionary:dic];
                [itemsArray addObject:model];
            }
            completionHandle(itemsArray,nil);
        }else{
            completionHandle(nil,error);
        }
    }];
}

@end

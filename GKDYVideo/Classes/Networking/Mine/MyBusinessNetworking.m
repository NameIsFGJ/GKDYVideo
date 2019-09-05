//
//  MyBusinessNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyBusinessNetworking.h"
#import "MyBusinessModel.h"
@implementation MyBusinessNetworking
+ (void)postMyBusinessWithToken:(NSString *)token
                       withPage:(NSInteger)page
                       withType:(NSInteger)type
                     completion:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/order/myBusiness"];
    NSDictionary *para = @{@"token":kUser.user_token,@"page":@(page),@"type":@(type)};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([[responseObj objectForKey:@"code"] integerValue] == 1) {
            NSDictionary *data = [responseObj objectForKey:@"data"];
            NSArray *rows = [data objectForKey:@"rows"];
            NSMutableArray *itemsArray = [NSMutableArray array];
            for (NSDictionary *dic in rows) {
                MyBusinessModel *model = [MyBusinessModel yy_modelWithDictionary:dic];
                [itemsArray addObject:model];
            }
            completionHandle(itemsArray,nil);
        }else{
            completionHandle(nil,error);
        }
    }];
}

@end

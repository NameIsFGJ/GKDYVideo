//
//  MyGoodsNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyGoodsNetworking.h"
#import "MyGoodsModel.h"
@implementation MyGoodsNetworking
+ (void)postIssueMyGoodsWithToken:(NSString *)token
                         withPage:(NSInteger)page
                       completion:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/goods/myGoods"];
    NSDictionary *para = @{@"token":token,@"page":@(page)};
    
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"respo34nseObj  =%@",responseObj);
        if ([[responseObj objectForKey:@"code"]integerValue] == 1) {
            
            NSDictionary *dic =  [responseObj objectForKey:@"data"];
            NSArray *array = [dic objectForKey:@"rows"];
            NSMutableArray *itemsArray = [NSMutableArray array];
            for (NSDictionary *dic in array) {
                MyGoodsModel *model = [MyGoodsModel yy_modelWithDictionary:dic];
                [itemsArray addObject:model];
            }
            completionHandle(itemsArray,nil);
        }else{
            completionHandle(nil,error);
        }
    }];
}
@end

//
//  UserVideoNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UserVideoNetworking.h"

@implementation UserVideoNetworking
+ (void)postSomeBodyVideo:(NSString *)token
                 withType:(NSInteger)type
                 withPage:(NSInteger)page
               withUserID:(NSInteger)userID
              complection:(void(^)(NSArray *array,NSError *error))complectionHandle;
{
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/somebodyVideo"];
    NSDictionary *para = @{@"token":token,@"type":@(type),@"page":@(page),@"user_id":@(userID)};
    [self POST:strUrl parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSArray *rows = responseObj[@"data"][@"rows"];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in rows) {
            SearchVideoModel *model = [SearchVideoModel yy_modelWithDictionary:dic];
            [tempArray addObject:model];
        }
        complectionHandle(tempArray,nil);
        
    }];
    
}
@end

//
//  SearchUsersNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchUsersNetworking.h"

@implementation SearchUsersNetworking
+ (void)postSearchUsers:(NSInteger)page keyworld: (NSString *)keyworld user_id:(NSInteger)inde completionHandle:(void(^)(NSMutableArray *modelArray,NSError *error))complectionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/searchUsers"];
    NSDictionary *params = @{@"page":@(page),@"keyword":keyworld,@"user_id":@(inde)};
    
    [self POST:urlStr parameters:params progress:^(NSProgress * _Nonnull progress) {
        NSLog(@"urlStr  =%@",urlStr);
        NSLog(@"params =%@",params);
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"responseObj  =%@",responseObj);
        if ([responseObj[@"error_msg"] isEqualToString:@"success"]) {
            NSArray *array = responseObj[@"data"];
           // complectionHandle([SearchUserModel yy_modelWithDictionary:dic],nil);
            NSMutableArray *tempArray = [NSMutableArray array];
            for (NSDictionary *dic in array)
            {
                SearchUserData *mode = [SearchUserData yy_modelWithDictionary:dic];
                [tempArray addObject:mode];
            }
            complectionHandle(tempArray,nil);
          
        }else{
            complectionHandle(nil,error);
        }
    }];
}

@end

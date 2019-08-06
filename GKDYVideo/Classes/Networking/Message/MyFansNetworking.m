//
//  MyFansNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyFansNetworking.h"

@implementation MyFansNetworking
+ (void)postMyFans:(NSString *)userToken
        withUserID:(NSInteger)user_id
          withPage:(NSInteger)page
        completion:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/my/myFans"];
    NSDictionary *param = @{@"user_token":userToken,@"user_id":@(user_id),@"page":@(page)};
    
    [self POST:urlStr parameters:param progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        
    }];
    
}
@end

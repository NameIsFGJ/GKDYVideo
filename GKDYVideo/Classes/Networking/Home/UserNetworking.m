//
//  UserNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UserNetworking.h"

@implementation UserNetworking
+ (void)postVideoGuanWithUserID:(NSString *)token withUserID:(NSInteger)userID completion:(void(^)(UserModel *model,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/user"];
    NSDictionary *para = @{@"token":kUser.user_token,@"user_id":@(userID)};
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        
        if ([[responseObj objectForKey:@"code"]integerValue] == 1) {
            
            UserModel *model = [UserModel yy_modelWithDictionary:[responseObj objectForKey:@"data"]];
        
            completionHandle(model,nil);
        }
    }];
}

@end

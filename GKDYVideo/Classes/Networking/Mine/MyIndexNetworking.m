//
//  MyIndexNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyIndexNetworking.h"

@implementation MyIndexNetworking
+ (void)postMyIndex:(NSString *)token
             userID:(NSNumber *)uid
   completionHandle:(void(^)(BaseModel *model, NSError *error))complectionhandle;
{
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/my/index"];
    NSDictionary *parameters = @{@"user_token":token,@"user_id":uid};
    [self POST:url
    parameters:parameters
      progress:^(NSProgress * _Nonnull progress)
    {
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if (!error) {
             complectionhandle([BaseModel yy_modelWithDictionary:responseObj],nil);
        }else{
             complectionhandle(nil,error);
        }
    }];
}
@end

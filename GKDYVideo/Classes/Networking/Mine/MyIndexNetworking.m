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
   completionHandle:(void(^)(DataModel *model, NSError *error))complectionhandle;
{
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/index"];
    NSDictionary *parameters = @{@"token":token};
    [self POST:url
    parameters:parameters
      progress:^(NSProgress * _Nonnull progress)
    {
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if (!error) {
            if ((NSInteger)[responseObj objectForKey:@"code"] == 1) {
                
            }
             complectionhandle([DataModel yy_modelWithDictionary:responseObj[@"data"]],nil);
        }else{
             complectionhandle(nil,error);
        }
    }];
}

@end

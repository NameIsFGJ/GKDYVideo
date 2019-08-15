//
//  FlollowingNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "FlollowingNetworking.h"

@implementation FlollowingNetworking
+ (void)postFlollowing:(NSString *)token
               toUseID:(NSInteger )tuid
      completionHandle:(void(^)(NewBaseModel *model, NSError *error))complectionhandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/following"];
    NSDictionary *dic = @{@"token":token,@"to_id":@(tuid)};
    NSLog(@"dic  =%@",dic);
    [self POST:urlStr parameters:dic progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        NSLog(@"respo34nseObj  =%@",responseObj);
       // NSDictionary *dic = responseObj[@"data"];
        complectionhandle([NewBaseModel yy_modelWithDictionary:responseObj],nil);
//        if ([responseObj[@"code"] integerValue] == 1) {
//              
//        }else{
//            complectionhandle(nil,error);
//        }
    }];
}

@end

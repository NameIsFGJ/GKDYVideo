//
//  VideoGuanNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "VideoGuanNetworking.h"
#import "VideoGuanModel.h"
@implementation VideoGuanNetworking
+ (void)postVideoGuanWithUserID:(NSString *)token withPage:(NSInteger)page completion:(void(^)(NSArray *array,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/guanVideo"];
    NSDictionary *par = @{@"token":token,@"page":@(page)};
    [self POST:urlStr parameters:par progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([responseObj[@"code"]integerValue] == 1) {
            NSArray *array = responseObj[@"data"][@"rows"];
            NSMutableArray *tempArray = [NSMutableArray array];
            for (NSDictionary *dic in array)
            {
                VideoGuanModel *mode = [VideoGuanModel yy_modelWithDictionary:dic];
                [tempArray addObject:mode];
            }
            completionHandle(tempArray,nil);
        }else{
            completionHandle(nil,error);
        }
    }];
}
@end

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
+ (void)postVideoGuanWithUserID:(NSInteger)userID withPage:(NSInteger)page completion:(void(^)(NSArray *array,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/videoGuan"];
    NSDictionary *par = @{@"user_id":@(userID),@"page":@(page)};
    [self POST:urlStr parameters:par progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([responseObj[@"error_msg"] isEqualToString:@"success"]) {
            NSArray *array = responseObj[@"data"];
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

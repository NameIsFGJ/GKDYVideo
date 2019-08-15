//
//  SearchVideosNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchVideosNetworking.h"
#import "SearchVideoModel.h"

@implementation SearchVideosNetworking
+ (void)postSearchVideoWithPage:(NSInteger)page
                        keyword:(NSString *)keyword
                          token:(NSString * )token
                     completion:(void(^)(NSMutableArray *modelArray,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/searchVideo"];
    NSDictionary *params = @{@"page":@(page),@"keyword":keyword,@"token":token};
    
    [self POST:urlStr parameters:params progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
       
        if ([responseObj[@"code"]integerValue] == 1) {
            NSArray *array = responseObj[@"data"][@"rows"];
            NSMutableArray *tempArray = [NSMutableArray array];
            for (NSDictionary *dic in array)
            {
                SearchVideoModel *model = [SearchVideoModel yy_modelWithDictionary:dic];
                [tempArray addObject:model];
            }
            completionHandle(tempArray,nil);
            
        }else{
            completionHandle(nil,error);
        }
    }];
}

@end

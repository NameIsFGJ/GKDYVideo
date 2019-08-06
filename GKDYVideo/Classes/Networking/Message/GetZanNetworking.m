//
//  GetZanNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GetZanNetworking.h"
#import "GetZanModel.h"
@implementation GetZanNetworking
+ (void)postGetZan:(NSInteger)user_id
          withPage:(NSInteger)page
        withVCType:(NSInteger)type
        completion:(void(^)(NSMutableArray *array, NSError *error))completionHandle;
{
    NSLog(@"type  =%ld",type);
    NSString *urlStr;
    if (type == 0) {
        urlStr= [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/message/getZan"];
    }else if (type == 1){
        urlStr= [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/message/getCom"];
    }
    NSLog(@"urlStr  =%@",urlStr);
    NSDictionary *para = @{@"user_id":@(1),@"page":@(page)};
    
    [self POST:urlStr parameters:para progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
        if ([responseObj[@"error_msg"] isEqualToString:@"success"]) {
            NSMutableArray *array = [NSMutableArray array];
            NSArray *dataArray = responseObj[@"data"];
            for (NSDictionary *dic in dataArray) {
                GetZanModel *model = [GetZanModel yy_modelWithDictionary:dic];
                [array addObject:model];
            }
            completionHandle(array,nil);
        }else{
            completionHandle(nil,error);
        }
    }];
    
}
@end

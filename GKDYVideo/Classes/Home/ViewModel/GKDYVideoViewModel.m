//
//  GKDYVideoViewModel.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKDYVideoViewModel.h"
#import "GKNetworking.h"
#import "IndexModel.h"
@interface GKDYVideoViewModel()

// 页码
@property (nonatomic, assign) NSInteger pn;

@end

@implementation GKDYVideoViewModel

- (void)refreshNewListWithSuccess:(void (^)(NSArray * _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    self.pn = 1;
    
    [self videoListRequestWithSuccess:success failure:failure];
}

- (void)refreshMoreListWithSuccess:(void (^)(NSArray * _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    self.pn ++;
    
    [self videoListRequestWithSuccess:success failure:failure];
}

- (void)videoListRequestWithSuccess:(void (^)(NSArray * _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[@"new_recommend_type"] = @"3";
    params[@"pn"] = @(self.pn);
    params[@"dl"] = @"505F80E58F3817291B7768CE59A90AF8";
    params[@"sign"] = @"3DD6882F963C25F5FA1ECA558F8CEF48";
    params[@"_timestamp"] = @"1537782764313";
    params[@"timestamp"] = @"1537782764313";
    params[@"net_type"] = @"1";
    //https://mf.zjchuanwen.com/api/video/index?page=1
    // 推荐列表
   //NSString *url = @"http://c.tieba.baidu.com/c/f/nani/recommend/list";
    NSString *url = @"https://mf.zjchuanwen.com/api/video/index?page=1";
    NSDictionary *param = @{@"page":@1};
    [GKNetworking get:url params:param success:^(id  _Nonnull responseObject) {
//        if ([responseObject[@"error_code"] integerValue] == 0) {
//            NSDictionary *data = responseObject[@"data"];
//
//            self.has_more = [data[@"has_more"] boolValue];
//
//            NSMutableArray *array = [NSMutableArray new];
//            for (NSDictionary *dic in data[@"data"]) {
//                GKDYVideoModel *model = [GKDYVideoModel yy_modelWithDictionary:dic];
//                [array addObject:model];
//            }
        
        //----------------------------------
        NSMutableArray *itemsArray = [NSMutableArray array];
        
        NSArray *array = [responseObject objectForKey:@"data"];
        for (NSDictionary *dic in array) {
            IndexModel *model = [IndexModel yy_modelWithDictionary:dic];
            [itemsArray addObject:model];
        }
       // NSLog(@"responseObject  =%@",responseObject);
            !success ? : success(itemsArray);
        NSLog(@"itemsArray.count  =%ld",itemsArray.count);
    } failure:^(NSError * _Nonnull error) {
        !failure ? : failure(error);
    }];
}

@end

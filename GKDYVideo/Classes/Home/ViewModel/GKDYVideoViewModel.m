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
    
    // 推荐列表
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/index"];
    
    NSDictionary *params;
    if ([User isLogin]){
        params = @{@"page":@1,@"user_id":kUser.user_id};
    }else{
        params =@{@"page":@1};
    }
    
    [GKNetworking get:url params:params success:^(id  _Nonnull responseObject) {
        //----------------------------------
        NSMutableArray *itemsArray = [NSMutableArray array];
        NSArray *array = [responseObject objectForKey:@"data"];
        for (NSDictionary *dic in array)
        {
            IndexModel *model = [IndexModel yy_modelWithDictionary:dic];
            [itemsArray addObject:model];
        }
            !success ? : success(itemsArray);
    } failure:^(NSError * _Nonnull error) {
        !failure ? : failure(error);
    }];
}

@end

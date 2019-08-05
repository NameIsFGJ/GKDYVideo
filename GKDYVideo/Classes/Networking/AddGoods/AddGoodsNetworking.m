//
//  AddGoodsNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddGoodsNetworking.h"
#import "AddGoodsInfoModel.h"
#import "AddGoodsModel.h"
@implementation AddGoodsNetworking
+ (void)postAddGoods:(AddGoodsInfoModel*)infoModel completion:(void(^)(AddGoodsModel *model, NSError *error))complectionHandle;
{
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/shop/addGoods"];
    NSDictionary *param = @{@"user_token":infoModel.user_token,
                            @"user_id":@(infoModel.user_id),
                            @"title":infoModel.title,
                            @"desc":infoModel.desc,
                            @"category_id":@(infoModel.category_id),
                            @"original_price":@(infoModel.original_price),
                            @"price":@(infoModel.price),
                            @"count":@(infoModel.count),
                            @"avatar":infoModel.avatar,
                            @"third_url":infoModel.third_url,
                            @"video_id":@(infoModel.video_id),
                            @"avatar":infoModel.avatar};
    NSLog(@"urlStr =%@",urlStr);
    NSLog(@"param  =%@",param);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain",@"image/jpeg", @"image/png", @"charset=utf-8", nil];
    
    [manager POST:urlStr parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [infoModel.avatar enumerateObjectsUsingBlock:^(UIImage * image, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *imageData = UIImageJPEGRepresentation(image, .5);
            NSString *name = [NSString stringWithFormat:@"%@[%ld]",@"avatar",idx];
            NSString *fileName = [NSString stringWithFormat:@"%@%ld",@"image",idx];
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/png"];
        }];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        AddGoodsModel *model = [AddGoodsModel yy_modelWithDictionary:responseObject[@"data"]];
        complectionHandle(model,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complectionHandle(nil, error);
    }];
}

@end

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
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/goods/addGoods"];
    NSDictionary *param = @{@"token":infoModel.user_token,
                            @"title":infoModel.title,
                            @"desc":infoModel.desc,
                            @"category_id":@(infoModel.category_id),
                            @"original_price":@(infoModel.original_price),
                            @"price":@(infoModel.price),
                            @"count":@(infoModel.count),
                            @"third_url":infoModel.third_url,
                            @"video_id":@(infoModel.video_id),
                            };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    
    [manager POST:urlStr parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        [infoModel.avatar enumerateObjectsUsingBlock:^(UIImage * image, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *imageData = UIImageJPEGRepresentation(image, .5);
            NSString *name = [NSString stringWithFormat:@"%@[%ld]",@"avatar",idx];
            NSString *fileName = [NSString stringWithFormat:@"%@%ld.png",@"image",idx];
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/png"];
        }];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@" ---AddGoods-- %lf",1.0*uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AddGoodsModel *model = [[AddGoodsModel alloc]init];
        model.code = [responseObject[@"code"] integerValue];
        complectionHandle(model,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complectionHandle(nil, error);
        NSLog(@"error 34 =%@",error);
    }];
    
    
    
    
}

@end

//
//  TestUploadNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "TestUploadNetworking.h"
#import "AddGoodsInfoModel.h"
@implementation TestUploadNetworking

+ (void)postUpLoadWithToken:(AddGoodsInfoModel *)model completion:(void(^)(NSString *msg,NSError *error))completionHandle;

{
    NSString *urlstr = @"http://mftest.zjchuanwen.com/api/goods/upload";
    NSDictionary *para = @{@"token":kUser.user_token};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain",@"image/jpeg", @"image/png", @"charset=utf-8", nil];

    [manager POST:urlstr parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        [model.avatar enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *imageData = UIImageJPEGRepresentation(image, .5);
            NSString *name = [NSString stringWithFormat:@"%@[%ld]",@"avatar",idx];
            NSString *fileName = [NSString stringWithFormat:@"%@%ld.png",@"image",idx];
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/png"];
        }];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //_values
        //WKNSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        NSLog(@" ---000-- %lf",1.0*uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
     
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObjec34t  =%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error33  =%@",error);
    }];
    
}
@end

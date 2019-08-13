//
//  IdCardUploadNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "IdCardUploadNetworking.h"

@implementation IdCardUploadNetworking
+ (void)postIdCardUpLoad:(NSString *)token withTrueName:(NSString *)name withIDCard:(NSInteger)cardNumber withPic:(UIImage *)pic withPicUn:(UIImage *)picUn completion:(void(^)(NewBaseModel *model,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/idCardUpload"];
    NSDictionary *para = @{@"token":token,@"true_name":name,@"id_card":@(cardNumber)};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:urlStr parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData1 = UIImageJPEGRepresentation(pic, .5);
        [formData appendPartWithFileData:imageData1 name:@"pic" fileName:@"image1" mimeType:@"image/jpeg"];
        
        NSData *imageData2 = UIImageJPEGRepresentation(picUn, .5);
        [formData appendPartWithFileData:imageData2 name:@"pic_un" fileName:@"image2" mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject  =%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error  =%@",error);
    }];
    
}
@end

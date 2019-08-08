//
//  UpLoadAvatarNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UpLoadAvatarNetworking.h"

@implementation UpLoadAvatarNetworking
+(void)postUploadAvatarWithToken:(NSString *)token
                      withAvator:(UIImage *)avatar
                      completion:(void(^)(UploadAvatarModel *model,NSError *error))completionHandle{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/user/uploadAvatar"];
    NSDictionary *parma = @{@"token":token};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:urlStr parameters:parma constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        // image --> data
        NSData *imageData = UIImageJPEGRepresentation(avatar, .5);
        
        [formData appendPartWithFileData:imageData name:@"avatar" fileName:@"head_pic.jpg" mimeType:@"image/jpeg"];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success  =%@",responseObject);
        completionHandle([UploadAvatarModel yy_modelWithDictionary:responseObject[@"data"]],nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error  =%@",error);
        completionHandle(nil,error);
    }];
    
    
}
@end

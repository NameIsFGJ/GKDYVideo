//
//  MusicNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MusicNetworking.h"

@implementation MusicNetworking
+ (void)postMusicNetworking:(NSString *)token complection:(void(^)(NSMutableArray *array,NSError *error))completionHandle;
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,@"/api/video/music"];
    NSDictionary *par = @{@"token":token};
    [self POST:urlStr parameters:par progress:^(NSProgress * _Nonnull progress) {
        
    } completionHandler:^(id  _Nullable responseObj, NSError * _Nullable error) {
       
        if ([[responseObj objectForKey:@"code"]integerValue] == 1) {
            NSMutableArray *array = [NSMutableArray array];
            
            for (NSDictionary *dic in responseObj[@"data"][@"rows"]) {
                MusicModel *model = [MusicModel yy_modelWithDictionary:dic];
                [array addObject:model];
            }
            
            completionHandle(array, nil);
        }
    }];
}



@end

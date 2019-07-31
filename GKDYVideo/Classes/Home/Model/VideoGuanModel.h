//
//  VideoGuanModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoModel : NSObject
@property (assign, nonatomic)NSInteger ide;
@property (strong, nonatomic)NSString * desc;
@property (strong, nonatomic)NSString * pic_url;
@property (strong, nonatomic)NSString * video_url;
@end

@interface VideoGuanModel : BaseModel
@property (assign, nonatomic)NSInteger g_id;
@property (assign, nonatomic)NSInteger from_user_id;
@property (assign, nonatomic)NSInteger to_user_id;
@property (strong, nonatomic)NSString * nickname;
@property (strong, nonatomic)NSString * head_pic;
@property (strong, nonatomic)NSArray<VideoModel *>*video;
@end

NS_ASSUME_NONNULL_END

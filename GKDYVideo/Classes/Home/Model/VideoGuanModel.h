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
@property (assign, nonatomic)NSInteger user_id;
@property (strong, nonatomic)NSString * video_url;
@property (strong, nonatomic)NSString * image;
@property (strong, nonatomic)NSString * name;
@property (assign, nonatomic)NSInteger is_recommand;
@property (assign, nonatomic)NSInteger recommand_weigh;
@property (assign, nonatomic)NSInteger is_show;
@property (assign, nonatomic)NSInteger z_count;
@property (assign, nonatomic)NSInteger c_count;
@property (assign, nonatomic)NSInteger share_count;
@property (assign, nonatomic)NSInteger status;
@property (assign, nonatomic)NSInteger create_time;
@property (assign, nonatomic)NSInteger update_time;
@property (assign, nonatomic)NSInteger delete_time;
@property (assign, nonatomic)NSInteger is_like;
@end

@interface ToUserModel : NSObject
@property (assign, nonatomic)NSInteger ide;
@property (strong, nonatomic)NSString * nickname;
@property (strong, nonatomic)NSString * mobile;
@property (strong, nonatomic)NSString * head_pic;

@end


@interface VideoGuanModel : BaseModel
@property (assign, nonatomic)NSInteger ide;
@property (assign, nonatomic)NSInteger from_id;
@property (assign, nonatomic)NSInteger to_id;
@property (strong, nonatomic)NSString * nickname;
@property (strong, nonatomic)NSString * head_pic;
@property (strong, nonatomic)NSString *create_time;
@property (strong, nonatomic)NSArray<VideoModel *>*video;
@property (strong, nonatomic)NSDictionary *to_user;
@end

NS_ASSUME_NONNULL_END

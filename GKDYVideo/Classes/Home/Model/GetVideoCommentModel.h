//
//  GetVideoCommentModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/25.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChildModel : NSObject
@property (assign, nonatomic) NSInteger comment_id;
@property (assign, nonatomic) NSInteger video_id;
@property (strong, nonatomic) NSString * content;
@property (strong, nonatomic) NSString * add_time;
@property (assign, nonatomic) NSInteger is_show;
@property (assign, nonatomic) NSInteger parent_id;
@property (assign, nonatomic) NSInteger target_id;
@property (assign, nonatomic) NSInteger user_id;
@property (assign, nonatomic) NSInteger zan_num;
@property (strong, nonatomic) NSString * zan_userid;
@property (strong, nonatomic) NSString * target_name;
@property (strong, nonatomic) NSString * nickname;
@property (strong, nonatomic) NSString * head_pic;
@property (assign, nonatomic) NSInteger is_zan;
@end

@interface GetVideoModel : NSObject
@property (assign, nonatomic) NSInteger comment_id;
@property (assign, nonatomic) NSInteger video_id;
@property (strong, nonatomic) NSString * content;
@property (strong, nonatomic) NSString * add_time;
@property (assign, nonatomic) NSInteger is_show;
@property (assign, nonatomic) NSInteger parent_id;
@property (assign, nonatomic) NSInteger target_id;
@property (assign, nonatomic) NSInteger user_id;
@property (assign, nonatomic) NSInteger zan_num;
@property (strong, nonatomic) NSString * zan_userid;
@property (strong, nonatomic) ChildModel *  child;
@property (assign, nonatomic) NSInteger num_2rd;
@property (strong, nonatomic) NSString *  nickname;
@property (strong, nonatomic) NSString * head_pic;
@property (assign, nonatomic) NSInteger is_zan;
@property (strong, nonatomic) NSString * time;
@end

@interface GetVideoCommentModel : BaseModel
@property (strong, nonatomic) GetVideoModel *data;
@property (assign, nonatomic) NSInteger num;

@end

NS_ASSUME_NONNULL_END

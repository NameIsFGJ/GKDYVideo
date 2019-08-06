//
//  GetZanModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetZanModel : BaseModel
@property (assign, nonatomic)NSInteger video_id;
@property (strong, nonatomic)NSString *desc;
@property (strong, nonatomic)NSString *send_time;
@property (strong, nonatomic)NSString *nickname;
@property (strong, nonatomic)NSString *head_pic;
@property (strong, nonatomic)NSString *video_url;
@property (strong, nonatomic)NSString *pic_url;

@end

NS_ASSUME_NONNULL_END

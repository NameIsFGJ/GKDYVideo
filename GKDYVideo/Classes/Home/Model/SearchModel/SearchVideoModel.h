//
//  SearchVideoModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchVideoModel : BaseModel
@property (assign, nonatomic)int ide;
@property (assign, nonatomic)int user_id;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *image;
@property (strong, nonatomic)NSString *z_count;
@property (strong, nonatomic)NSString *video_url;
@property (strong, nonatomic)NSDictionary *user;

@end

NS_ASSUME_NONNULL_END

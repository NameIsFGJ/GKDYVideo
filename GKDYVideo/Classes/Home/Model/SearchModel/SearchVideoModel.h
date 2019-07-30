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
@property (assign, nonatomic)int iden;
@property (assign, nonatomic)int user_id;
@property (strong, nonatomic)NSString *nickname;
@property (strong, nonatomic)NSString *desc;
@property (strong, nonatomic)NSString *pic_url;
@property (strong, nonatomic)NSString *video_url;
@end

NS_ASSUME_NONNULL_END

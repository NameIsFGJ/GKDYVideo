//
//  LikeVideoModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LikeVideoModel : BaseModel

@property (assign, nonatomic)NSInteger status;
@property (strong, nonatomic)NSString *data;
@end

NS_ASSUME_NONNULL_END

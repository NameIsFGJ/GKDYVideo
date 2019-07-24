//
//  LikeVideoModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data : NSObject
@property (strong, nonatomic)NSString *msg;
@property (assign, nonatomic)NSInteger status;
@property (strong, nonatomic)NSString *result;
@end

@interface LikeVideoModel : BaseModel
@property (strong, nonatomic)NSString *msg;
@property (assign, nonatomic)NSInteger status;
@property (strong, nonatomic)NSString *result;
@end

NS_ASSUME_NONNULL_END

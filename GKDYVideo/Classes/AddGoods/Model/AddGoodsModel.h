//
//  AddGoodsModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddGoodsModel : BaseModel
@property (assign, nonatomic)NSInteger status;
@property (strong, nonatomic)NSString *msg;
@property (strong, nonatomic)NSString *result;
@end

NS_ASSUME_NONNULL_END

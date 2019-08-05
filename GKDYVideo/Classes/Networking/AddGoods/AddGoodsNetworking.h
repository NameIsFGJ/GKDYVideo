//
//  AddGoodsNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
@class AddGoodsInfoModel;
@class AddGoodsModel;
NS_ASSUME_NONNULL_BEGIN
// completionHandle:(void(^)(LikeVideoModel *model, NSError *error))complectionhandle;
@interface AddGoodsNetworking : BaseNetworking
+ (void)postAddGoods:(AddGoodsInfoModel*)infoModel completion:(void(^)(AddGoodsModel *model, NSError *error))complectionHandle;



@end

NS_ASSUME_NONNULL_END

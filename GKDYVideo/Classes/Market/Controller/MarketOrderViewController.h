//
//  MarketOrderViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarketOrderViewController : BaseViewController
// 昵称
@property (strong, nonatomic) NSString *nickName;
// 头像
@property (strong, nonatomic) NSString *head_pic;
// 商品图片
@property (strong, nonatomic) NSString *image_list;
// 图片名称
@property (strong, nonatomic) NSString *name;
// 售价
@property (strong, nonatomic) NSString *price;
// 库存
@property (assign, nonatomic) NSInteger count;
// 运费
@property (assign, nonatomic) NSInteger postMoney;

// 商品id
@property (assign, nonatomic) NSInteger goodsId;
// 卖家 id
@property (assign, nonatomic) NSInteger salerId;
@end

NS_ASSUME_NONNULL_END

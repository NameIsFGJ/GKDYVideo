//
//  NewMarketShopCartModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface GoodsModel : NSObject
@property (strong, nonatomic) NSString *categoryId;
@property (assign, nonatomic) NSInteger count;
@property (strong, nonatomic) NSString *goodsId;
@property (strong, nonatomic) NSString *goodsName;
@property (assign, nonatomic) NSInteger goodsType;
@property (strong, nonatomic) NSString * ide;
@property (assign, nonatomic) NSInteger orginalPrice;
@property (assign, nonatomic) NSInteger realPrice;
@property (strong, nonatomic) NSString *shopId;
@property (strong, nonatomic) NSString *shopName;
@property (strong, nonatomic) NSString *sid;
@property (assign, nonatomic) NSInteger total;
@property (strong, nonatomic) NSString * userId;

@property (nonatomic, assign) BOOL isSelect;

@end


@interface NewMarketShopCartModel : NSObject
@property (strong, nonatomic) NSString *ide;
@property (strong, nonatomic) NSString *shopName;
@property (strong, nonatomic) NSString *sid;
@property (strong, nonatomic) NSArray<GoodsModel *> *goods;

@property (nonatomic, assign) BOOL isSelect;

@end


NS_ASSUME_NONNULL_END

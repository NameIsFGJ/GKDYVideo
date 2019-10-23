//
//  NewMarketShopCartModel.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMarketShopCartModel.h"


@implementation GoodsModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ide" : @"id",
             };
}
@end

@implementation NewMarketShopCartModel
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"goods" : [GoodsModel class]}
    ;
}
@end



//
//  MarketModel.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketModel.h"

@implementation HotGoodsModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ide" : @"id",
             };
}

@end

@implementation MarketModel
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
   
    return @{@"ad_list" : [AdListModel class],
             @"category":[CategoryModel class],
             @"hot_goods":[HotGoodsModel class],
             @"hot_rent":[HotRentModel class]};
}

@end

@implementation HotRentModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ide" : @"id",
             };
}

@end

@implementation CategoryModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ide" : @"id",
             };
}
@end

@implementation AdListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ide" : @"id",
             };
}

@end

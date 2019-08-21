//
//  MarketUserShopModel.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketUserShopModel.h"

@implementation RowsModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ide" : @"id",
             };
}

@end

@implementation MarketUserShopModel
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"rows" : [RowsModel class]}
            ;
}

@end



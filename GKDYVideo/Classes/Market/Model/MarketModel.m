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

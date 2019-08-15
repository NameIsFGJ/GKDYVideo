//
//  UserModel.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ide" : @"id",
             };
}

@end

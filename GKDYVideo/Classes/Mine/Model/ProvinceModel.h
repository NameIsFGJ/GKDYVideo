//
//  ProvinceModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/9.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityModel : NSObject
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSArray *area;
@end

@interface ProvinceModel : NSObject
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSArray *city;
@end

NS_ASSUME_NONNULL_END

//
//  BaseModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface BaseModel : NSObject
@property (assign, nonatomic)NSInteger error_code;
@property (strong, nonatomic)NSString * error_msg;
@end

NS_ASSUME_NONNULL_END

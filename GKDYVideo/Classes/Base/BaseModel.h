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

/*
 "error_code": 0,
 "error_msg": "success",
 "data": {
 "status": -9,
 "msg": "已点赞，无需重复点赞",
 "result": "
 */
@end

NS_ASSUME_NONNULL_END

//
//  NewBaseModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewBaseModel : NSObject
@property (assign, nonatomic)NSInteger code;
@property (strong, nonatomic)NSString *msg;
@property (strong, nonatomic)NSString *time;
@property (strong, nonatomic)NSString *data;
@end

NS_ASSUME_NONNULL_END

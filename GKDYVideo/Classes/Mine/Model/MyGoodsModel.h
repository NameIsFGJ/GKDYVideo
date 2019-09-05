//
//  MyGoodsModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyGoodsModel : NSObject
@property (assign, nonatomic) NSInteger ide;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *price;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic) NSInteger com_count;
@property (assign, nonatomic) NSInteger status;
@property (strong, nonatomic) NSString *cover;

@end

NS_ASSUME_NONNULL_END

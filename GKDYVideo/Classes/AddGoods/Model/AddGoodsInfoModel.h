//
//  AddGoodsInfoModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddGoodsInfoModel : NSObject
@property (strong, nonatomic)NSString *user_token;
@property (assign, nonatomic)NSInteger user_id;
@property (strong, nonatomic)NSString *title;
@property (strong, nonatomic)NSString *desc;
@property (assign, nonatomic)NSInteger category_id;
@property (assign, nonatomic)float original_price;
@property (assign, nonatomic)float price;
@property (assign, nonatomic)NSInteger count;
@property (strong, nonatomic)NSArray *avatar;
@property (strong, nonatomic)NSString *third_url;
@property (assign, nonatomic)NSInteger video_id;

@end

NS_ASSUME_NONNULL_END

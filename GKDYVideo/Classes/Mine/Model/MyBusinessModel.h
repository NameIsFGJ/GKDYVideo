//
//  MyBusinessModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyBusinessModel : NSObject
@property (assign, nonatomic)NSInteger ide;
@property (strong, nonatomic)NSString * order_sn;
@property (assign, nonatomic)NSInteger user_id;
@property (assign, nonatomic)NSInteger saler_id;
@property (assign, nonatomic)NSInteger goods_id;
@property (strong, nonatomic)NSString * goods_name;
@property (assign, nonatomic)NSString * cover;
@property (assign, nonatomic)NSString * goods_price;
@property (assign, nonatomic)NSString * order_amount;
@property (assign, nonatomic)NSInteger goods_num;
@property (assign, nonatomic)NSInteger pay_status;
@property (assign, nonatomic)NSInteger ship_status;
@property (assign, nonatomic)NSString * consignee;
@property (assign, nonatomic)NSString * mobile;
@property (assign, nonatomic)NSInteger refund_status;

@end

NS_ASSUME_NONNULL_END

//
//  OrderDetailModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailModel : NSObject

@property (assign, nonatomic) NSInteger ide;
@property (strong, nonatomic) NSString * orderSn;
@property (assign, nonatomic) NSInteger userID;
@property (assign, nonatomic) NSInteger salerID;
@property (assign, nonatomic) NSInteger goodsID;
@property (strong, nonatomic) NSString * goodsName;
@property (strong, nonatomic) NSString * cover;
@property (strong, nonatomic) NSString * goodsPrice;
@property (strong, nonatomic) NSString * orderAmount;
@property (assign, nonatomic) NSInteger goodsNum;
@property (assign, nonatomic) NSInteger payStatus;
@property (assign, nonatomic) NSInteger shipStatus;
@property (strong, nonatomic) NSString * consignee;
@property (strong, nonatomic) NSString * address;
@property (strong, nonatomic) NSString * mobile;
@property (assign, nonatomic) NSInteger refundStatus;
@property (strong, nonatomic) NSString * ship_name;
@property (strong, nonatomic) NSString * ship_code;

@end

NS_ASSUME_NONNULL_END

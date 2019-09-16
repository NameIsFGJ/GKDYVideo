//
//  ReturnGoodsNetworking.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/14.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ReturnGoodsNetworking.h"

@implementation ReturnGoodsNetworking
+ (void)postApplyRefundWithToken:(NSString *)token
                     withSalerID:(NSInteger)salderID
                     withOrderID:(NSInteger)orderID
                 withRefundPrice:(float)price
                      withReason:(NSString *)reson
                       withNotes:(NSString *)notes
                      completion:(void(^)(NSInteger code,NSError *error))completionHandle{
    
}

@end

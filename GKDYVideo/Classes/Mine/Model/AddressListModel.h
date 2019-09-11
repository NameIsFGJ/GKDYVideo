//
//  AddressListModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/9.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressListModel : NSObject
@property (assign, nonatomic) NSInteger ide;
@property (assign, nonatomic) NSInteger user_id;
@property (strong, nonatomic) NSString * consignee;
@property (strong, nonatomic) NSString * city;
@property (strong, nonatomic) NSString * address;
@property (strong, nonatomic) NSString * zipcode;
@property (strong, nonatomic) NSString * mobile;
@property (assign, nonatomic) NSInteger is_default;
@property (assign, nonatomic) NSInteger is_show;

@end

NS_ASSUME_NONNULL_END

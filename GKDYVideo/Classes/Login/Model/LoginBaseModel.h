//
//  LoginBaseModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data : NSObject
@property (strong, nonatomic)NSString *user_token;
@property (strong, nonatomic)NSString *mobile;
@property (strong, nonatomic)NSString *nick_name;
@property (strong, nonatomic)NSString *head_pic;
@property (strong, nonatomic)NSString *user_money;
@property (assign, nonatomic)NSInteger user_id;
@end

@interface LoginBaseModel : BaseModel
//@property (strong, nonatomic) NSArray<WithdrawItem *> *withdrawItems;
//@property (strong, nonatomic) NSArray<Data *> *data;
@property (strong,nonatomic)Data *data;
@end

NS_ASSUME_NONNULL_END

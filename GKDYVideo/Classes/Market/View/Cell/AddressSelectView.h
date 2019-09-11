//
//  AddressSelectView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/9.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^GetCity)(NSString *string);
@interface AddressSelectView : UIView
@property (copy, nonatomic)GetCity getCity;

@end

NS_ASSUME_NONNULL_END

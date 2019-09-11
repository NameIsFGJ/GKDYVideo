//
//  AddressEditViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"
#import "AddressListModel.h"

typedef void(^GetAddressBlock)(AddressListModel * _Nullable model);

NS_ASSUME_NONNULL_BEGIN

@interface AddressEditViewController : BaseViewController
@property (copy, nonatomic)GetAddressBlock block;
@end

NS_ASSUME_NONNULL_END

//
//  AddressEditNewViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/9.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"
#import "AddressListModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef enum{
    newEdit = 1,
    oldEdit
}EditType;
@interface AddressEditNewViewController : BaseViewController
@property (assign, nonatomic)EditType editType;
@property (strong, nonatomic)AddressListModel *model;
@end

NS_ASSUME_NONNULL_END

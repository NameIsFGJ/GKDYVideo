//
//  SexPickerView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ReloadDataBlock)(void);
@interface SexPickerView : UIView
@property (copy, nonatomic)ReloadDataBlock block;

@end

NS_ASSUME_NONNULL_END

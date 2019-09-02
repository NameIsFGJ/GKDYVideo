//
//  VideoDeleteButton.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    PLSDeleteButtonStyleDelete,
    PLSDeleteButtonStyleNormal,
    PLSDeleteButtonStyleDisable,
} PLSDeleteButtonStyle;

@interface VideoDeleteButton : UIButton

@property (assign, nonatomic) PLSDeleteButtonStyle style;

- (void)setButtonStyle:(PLSDeleteButtonStyle)style;
+ (VideoDeleteButton *)getInstance;
@end

NS_ASSUME_NONNULL_END

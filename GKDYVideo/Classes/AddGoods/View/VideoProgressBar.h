//
//  VideoProgressBar.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    PLSProgressBarProgressStyleNormal,
    PLSProgressBarProgressStyleDelete,
} PLSProgressBarProgressStyle;

@interface VideoProgressBar : UIView
- (void)setLastProgressToStyle:(PLSProgressBarProgressStyle)style;
- (void)setLastProgressToWidth:(CGFloat)width;

- (void)deleteLastProgress;
- (void)deleteAllProgress;
- (void)addProgressView;

- (void)stopShining;
- (void)startShining;
@end

NS_ASSUME_NONNULL_END

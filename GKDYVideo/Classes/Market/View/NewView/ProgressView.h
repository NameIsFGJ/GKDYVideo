//
//  ProgressView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressView : UIView
@property (strong, nonatomic)UIView *pickView;
@property (strong, nonatomic)UIView *grayView;
@property (strong, nonatomic)UILabel *disCountLabel;
@property (strong, nonatomic)UILabel *percentLabel;
@end

NS_ASSUME_NONNULL_END

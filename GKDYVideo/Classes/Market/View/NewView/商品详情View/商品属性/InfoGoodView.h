//
//  InfoGoodView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/28.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^InfoViewBlock)();

@interface InfoGoodView : UIView
@property (copy, nonatomic) InfoViewBlock block;

- (void)animation;
@end

NS_ASSUME_NONNULL_END

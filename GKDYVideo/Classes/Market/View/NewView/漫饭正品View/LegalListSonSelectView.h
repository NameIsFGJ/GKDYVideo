//
//  LegalListSonSelectView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^HideViewBlock)(void);

@interface LegalListSonSelectView : UIView

@property (copy, nonatomic) HideViewBlock block;


- (instancetype)initWithHeight:(float)navHeight;
@end

NS_ASSUME_NONNULL_END

//
//  LegalListSelectView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/7.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LegalListSelectViewDelegate <NSObject>

- (void)showSonSelectView;

@end


@interface LegalListSelectView : UIView

@property (weak, nonatomic) id<LegalListSelectViewDelegate>delegate;


- (instancetype)initWithHeight:(float)navHeight;

@end

NS_ASSUME_NONNULL_END

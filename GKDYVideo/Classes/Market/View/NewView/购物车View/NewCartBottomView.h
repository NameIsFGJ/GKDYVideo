//
//  NewCartBottomView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickAllBlock)(BOOL isClick);
typedef void(^TotalPriceBlock)(void);
typedef void(^DeleteGoodsBlock)(void);

@interface NewCartBottomView : UIView
@property (strong, nonatomic) UIButton *clickButton;
@property (strong, nonatomic) UILabel *label0;
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *totalPriceLabel;
@property (strong, nonatomic) UIButton *accountButton;
@property (assign, nonatomic) BOOL isClick;
@property (copy, nonatomic) ClickAllBlock clickBlock;
@property (strong, nonatomic) UIButton *deleteGoodsButton;
@property (copy, nonatomic) TotalPriceBlock totalBlock;
@property (copy, nonatomic) DeleteGoodsBlock deleteBlock;

@end

NS_ASSUME_NONNULL_END

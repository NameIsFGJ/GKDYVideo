//
//  NewCartTableViewHeader.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewMarketShopCartModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickSectionBlock)(BOOL isSelected);

@interface NewCartTableViewHeader : UITableViewHeaderFooterView

@property (strong, nonatomic) UIButton *clickButton;
@property (strong, nonatomic) UIImageView *shopImageView;
@property (strong, nonatomic) UILabel *shopNameLabel;
@property (copy, nonatomic) ClickSectionBlock  clickSection;
@property (assign, nonatomic) BOOL isClick;
@property (strong, nonatomic) NewMarketShopCartModel *model;

@end

NS_ASSUME_NONNULL_END

//
//  MyBuyTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/25.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyBusinessModel;
NS_ASSUME_NONNULL_BEGIN

@interface MyBuyTableViewCell : UITableViewCell
/*
 *goodsNumberLabel;
 @property (weak, nonatomic) IBOutlet UILabel *payStatusLabel;
 @property (weak, nonatomic) IBOutlet UIButton *returnGoodsButton;
 @property (weak, nonatomic) IBOutlet UIButton *cancelButton;
 @property (weak, nonatomic) IBOutlet UIButton *contactButton;
 */
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *payStatusLabel;
@property (weak, nonatomic) IBOutlet UIButton *returnGoodsButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *contactButton;
@property (strong, nonatomic) MyBusinessModel *model;


@end

NS_ASSUME_NONNULL_END

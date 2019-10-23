//
//  NewCartTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GoodsModel;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickRowBlock)(BOOL isSelected);
typedef void(^LoseCountBlock)(UILabel *label);
typedef void(^AddCountBlock)(UILabel *label);
@interface NewCartTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *clickButton;
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodDecLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodMarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *loseButton;
@property (weak, nonatomic) IBOutlet UILabel *goodCountLabel;

@property (copy, nonatomic) ClickRowBlock clickRow;
@property (copy, nonatomic) LoseCountBlock lostCount;
@property (copy, nonatomic) AddCountBlock addCount;
@property (strong, nonatomic) GoodsModel *model;
@end

NS_ASSUME_NONNULL_END

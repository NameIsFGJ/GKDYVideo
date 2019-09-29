//
//  MyBusinessTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyBusinessModel;
NS_ASSUME_NONNULL_BEGIN

typedef enum{
    cellBuyType = 1,
    cellSellTyle
}CellType;

@interface MyBusinessTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *payStatusLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *contactLabel;
@property (weak, nonatomic) IBOutlet UIButton *refundButton;
@property (strong, nonatomic) MyBusinessModel *model;
@property (assign, nonatomic) CellType cellType;
@end

NS_ASSUME_NONNULL_END

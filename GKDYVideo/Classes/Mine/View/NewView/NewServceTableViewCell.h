//
//  NewServceTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/14.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ServceTableViewCellDelegate <NSObject>

- (void)buttonClickForServceAppraise;

- (void)buttonClickForBackPay;

@end


@interface NewServceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) id<ServceTableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END

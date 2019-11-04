//
//  NewAllOrderTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol OrderCellDelegate <NSObject>

- (void)button1Click:(UIButton *)sender;
- (void)button2Click:(UIButton *)sender;
- (void)button3Click:(UIButton *)sender;

@end



@interface NewAllOrderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodStatusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

//@property (nonatomic, weak) id<GKDYVideoControlViewDelegate> delegate;

@property (weak, nonatomic) id<OrderCellDelegate> delegate;


@end

NS_ASSUME_NONNULL_END

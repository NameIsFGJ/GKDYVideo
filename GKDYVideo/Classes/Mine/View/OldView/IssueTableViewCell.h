//
//  IssueTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyGoodsModel;

NS_ASSUME_NONNULL_BEGIN

@protocol IssueTableViewCellDeletgate <NSObject>

// 删除
- (void)deleteButtonActionFromCell:(UIButton *)button;
// 编辑
- (void)editButtonActionFromCell:(UIButton *)button;
// 分享
- (void)shareButtonActionFromCell:(UIButton *)button;

@end

@interface IssueTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *comNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIImageView *shareImageView;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) MyGoodsModel *model;
@property (weak, nonatomic) id <IssueTableViewCellDeletgate> delegate;


@end

NS_ASSUME_NONNULL_END
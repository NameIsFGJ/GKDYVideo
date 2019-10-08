//
//  IssueTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "IssueTableViewCell.h"
#import "MyGoodsModel.h"
#import "MyBusinessModel.h"
@implementation IssueTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MyGoodsModel *)model
{
    _model = model;
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@",kSERVICE,model.cover];
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    self.nameLabel.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",model.price];
    self.comNumLabel.text = [NSString stringWithFormat:@"留言: %ld",model.com_count];
    self.countLabel.text = [NSString stringWithFormat:@"库存: %ld",model.count];
}

//  分享
- (IBAction)shareButtonAction:(UIButton *)sender {
    if ([self respondsToSelector:@selector(shareButtonAction:)]) {
        [self.delegate shareButtonActionFromCell:sender];
    }
}

// 编辑
- (IBAction)editButtonAction:(UIButton *)sender {
    if ([self respondsToSelector:@selector(editButtonAction:)]) {
        [self.delegate editButtonActionFromCell:sender];
    }
}

// 删除
- (IBAction)deleteButtonAction:(UIButton *)sender {
    if ([self respondsToSelector:@selector(deleteButtonAction:)]) {
        [self.delegate deleteButtonActionFromCell:sender];
    }
}








@end
//
//  IssueTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "IssueTableViewCell.h"
#import "MyGoodsModel.h"
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
    NSLog(@"model.name  =%@",model.name);
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",model.price];
    self.comNumLabel.text = [NSString stringWithFormat:@"留言: %ld",model.com_count];
    self.countLabel.text = [NSString stringWithFormat:@"库存: %ld",model.count];
}
@end

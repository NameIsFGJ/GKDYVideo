//
//  NewCartTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewCartTableViewCell.h"
#import "NewMarketShopCartModel.h"
@implementation NewCartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(GoodsModel *)model
{
    _model = model;
    
    self.clickButton.selected = model.isSelect;
    if (model.isSelect) {
        [self.clickButton setImage:[UIImage imageNamed:@"reasonSelected"] forState:UIControlStateNormal];
    }else{
        [self.clickButton setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
    }
    self.goodNameLabel.text = model.goodsName;
    self.goodPriceLabel.text = [NSString stringWithFormat:@"%ld",model.orginalPrice];
    self.goodCountLabel.text = [NSString stringWithFormat:@"%ld",model.count];
    
}

// 是否选中
- (IBAction)clickButtonAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"reasonSelected"] forState:UIControlStateNormal];
    }else{
        [sender setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
        
    }
    if (self.clickRow) {
        self.clickRow(sender.selected);
    }
}
// 减 数量
- (IBAction)loseButtonAction:(UIButton *)sender {
    
    NSInteger count = [self.goodCountLabel.text integerValue];
    count --;
    if (count <= 0) {
        return;
    }
    
    self.goodCountLabel.text = [NSString stringWithFormat:@"%ld",count];
    if (self.lostCount) {
        self.lostCount(self.goodCountLabel);
    }
}

// 加 数量
- (IBAction)addButtonAction:(UIButton *)sender {
    
    NSInteger count = [self.goodCountLabel.text integerValue];
    count ++;
    
    self.goodCountLabel.text = [NSString stringWithFormat:@"%ld",count];
    if (self.addCount) {
        self.addCount(self.goodCountLabel);
    }
}

@end

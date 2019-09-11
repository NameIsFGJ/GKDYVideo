//
//  MyBusinessTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyBusinessTableViewCell.h"
#import "MyBusinessModel.h"
@implementation MyBusinessTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MyBusinessModel *)model
{
    _model = model;
    //  商品图片
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kSERVICE,model.cover]]];
    
    //  商品名称
    self.goodsName.text = model.goods_name;
    
    //  单价
    self.goodsPriceLabel.text = model.goods_price;
    
    //  件数
    self.goodsNumLabel.text = [NSString stringWithFormat:@"%ld",model.goods_num];
    
    //  联系卖家
    NSString *mobile = model.mobile;
    
    //  退款状态
    
    
    // 支付状态   0  未付款  1 已付款
    // 物流状态   0  无信息  1  未发货   2  已发货    3    已收货
    //  交易关闭    等待卖家发货   退款中   卖家已发货   未付款    交易完成
    
    /*
        0 未支付 +  0           显示  未付款
        1 已付款 +  1 未发货     显示  等待卖家发货
        1 已付款 +  2 已发货     显示  卖家已发货
        1 已付款 +  3 已收货     显示  交易完成
     */
     NSInteger payStatus = model.pay_status;
     NSInteger shipStatus = model.ship_status;
   
    
    if (payStatus == 0 && shipStatus == 0) {
        self.payStatusLabel.text = @"未付款";
        [self.deleteButton setTitle:@"去付款" forState:UIControlStateNormal];
       
    }
    
    if (payStatus == 1 && shipStatus == 1) {
        self.payStatusLabel.text = @"已付款";
        [self.deleteButton setTitle:@"等待卖家发货" forState:UIControlStateNormal];
    }
    
    if (payStatus == 1 && shipStatus == 2) {
        self.payStatusLabel.text = @"已付款";
        [self.deleteButton setTitle:@"卖家已发货" forState:UIControlStateNormal];
    }
    
    if (payStatus == 1 && shipStatus == 3) {
        self.payStatusLabel.text = @"已付款";
        [self.deleteButton setTitle:@"交易完成" forState:UIControlStateNormal];
    }
    
    
    
}

@end

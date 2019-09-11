//
//  AddressEditTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressEditTableViewCell.h"
#import "AddressListModel.h"
@implementation AddressEditTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//- (void)clickCellButtonAction:(AddressEditTableViewCell *)cell;
- (IBAction)editButtonAction:(UIButton *)sender {
    
    NSLog(@"sender.tag = %ld ",sender.tag);
    
    // UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    if ([self respondsToSelector:@selector(editButtonAction:)]) {
        [self.delegate clickCellButtonAction:sender];
        
        
    }
}

- (void)setModel:(AddressListModel *)model
{
    _model = model;
    self.userNameLabel.text = [NSString stringWithFormat:@"%@   %@",model.consignee,model.mobile];
    
    NSString *city = [model.city stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    self.userAddressLabel.text = [NSString stringWithFormat:@"%@%@",city,model.address];
}


@end

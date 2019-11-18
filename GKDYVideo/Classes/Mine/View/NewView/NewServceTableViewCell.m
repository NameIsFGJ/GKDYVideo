//
//  NewServceTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/14.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewServceTableViewCell.h"

@implementation NewServceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.button1.layer.cornerRadius = 15;
    self.button1.layer.borderWidth = 1;
    self.button1.layer.borderColor = kBgColor.CGColor;
    self.button1.layer.masksToBounds = YES;
    
    self.button2.layer.cornerRadius = 15;
    self.button2.layer.borderWidth = 1;
    self.button2.layer.borderColor = kBgColor.CGColor;
    self.button2.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
  //  - (void)buttonClickForServceAppraise;
    
  //  - (void)buttonClickForBackPay;
}
- (IBAction)button1Action:(UIButton *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(buttonClickForServceAppraise)])
    {
        [self.delegate buttonClickForServceAppraise];
    }
}
- (IBAction)button2Action:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(buttonClickForBackPay)])
    {
        [self.delegate buttonClickForBackPay];
    }
}


@end

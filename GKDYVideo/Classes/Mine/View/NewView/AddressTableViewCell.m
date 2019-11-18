//
//  AddressTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/14.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)defaultButtonAction:(UIButton *)sender {
    NSLog(@"默认");
}
- (IBAction)deleteButtonAction:(UIButton *)sender {
    NSLog(@"删除");
}
- (IBAction)editButtonAction:(UIButton *)sender {
    NSLog(@"编辑");
}

@end

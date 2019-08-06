//
//  MessageCommonTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MessageCommonTableViewCell.h"
#import "GetZanModel.h"
@implementation MessageCommonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.head_pic.layer.cornerRadius = 25.0f;
    self.head_pic.layer.masksToBounds = YES;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(GetZanModel *)model
{
    _model = model;
    
    // 头像
    NSString *head_pic_url = [NSString stringWithFormat:@"%@%@",kSERVICE,model.head_pic];
    [self.head_pic sd_setImageWithURL:[NSURL URLWithString:head_pic_url]];
    
    // 昵称
    self.nickName.text = model.nickname;
    
    // 评论
    self.desc.text = model.desc;
    
    //作品图片
    NSString *pic_url = [NSString stringWithFormat:@"%@%@",kSERVICE,model.pic_url];
    [self.pic_url sd_setImageWithURL:[NSURL URLWithString:pic_url] placeholderImage:[UIImage imageNamed:@"chat_icon"]];
}
@end

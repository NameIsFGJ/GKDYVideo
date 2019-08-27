//
//  SearchHistoryTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/27.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchHistoryTableViewCell.h"

@implementation SearchHistoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"historyIcon"]];
       // imageView.frame = CGRectMake(40, 10, 13, 13);
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(40);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        self.historyLabel = [[UILabel alloc]init];
        //WithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+ 10, CGRectGetMinY(imageView.frame), 200, 13)]
        [self.historyLabel setTextColor:kWhiteColor];
        [self.contentView addSubview:self.historyLabel];
        [self.historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(imageView.mas_right).offset(10);
            //make.top.mas_equalTo(5);
           // make.bottom.mas_equalTo(5);
            make.right.mas_equalTo(-5);
        }];
    }
    return self;
}

- (UILabel *)historyLabel
{
    if (!_historyLabel)
    {
        _historyLabel = [[UILabel alloc]init];
        _historyLabel.font = kFontSize(14);
       // [_historyLabel setTextColor:kWhiteColor];
    }
    return _historyLabel;
}

@end

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
        //self.backgroundColor  = [UIColor colorWithHex:@"#222934"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"historyIcon"]];
        imageView.frame = CGRectMake(40, 10, 13, 13);
        [self.contentView addSubview:imageView];
        
        self.historyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+ 10, CGRectGetMinY(imageView.frame), 200, 13)];
        [self.historyLabel setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.historyLabel];
        
    }
    return self;
}

- (UILabel *)historyLabel
{
    if (!_historyLabel)
    {
        _historyLabel = [[UILabel alloc]init];
        _historyLabel.font = kFontSize(14);
       // [_historyLabel setTextColor:[UIColor whiteColor]];
    }
    return _historyLabel;
}

@end

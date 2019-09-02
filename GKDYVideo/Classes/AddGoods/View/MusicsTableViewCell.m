//
//  MusicsTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MusicsTableViewCell.h"
#import "MusicModel.h"
@implementation MusicsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    [self.pauseButton setImage:[UIImage imageNamed:@"bofang"] forState:UIControlStateNormal];
    [self.pauseButton setImage:[UIImage imageNamed:@"zanting"] forState:UIControlStateSelected];
    
    [self.pauseButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(id)button
{//- (void)pauseButtonAction:(MusicsTableViewCell *_Nullable)cell;
    if ([self.delegate respondsToSelector:@selector(pauseButtonAction:)]) {
        [self.delegate pauseButtonAction:self];
    }
    UIButton *btn = (UIButton *)button;
    btn.selected = !btn.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setModel:(MusicModel *)model
{
    _model = model;
    
    // image 图片
    // name
    self.nameLabel.text = model.name;
    // user
}

@end

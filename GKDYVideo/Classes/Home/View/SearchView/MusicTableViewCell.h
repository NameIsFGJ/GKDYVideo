//
//  MusicTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicTableViewCell : UITableViewCell
@property (strong, nonatomic)UIImageView *iconImageView;
@property (strong, nonatomic)UILabel *musicNameLabel;
@property (strong, nonatomic)UILabel *musicTimeLabel;
@property (strong, nonatomic)UIButton *playButton;
@end

NS_ASSUME_NONNULL_END

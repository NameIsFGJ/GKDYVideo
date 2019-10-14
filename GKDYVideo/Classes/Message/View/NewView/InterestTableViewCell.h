//
//  InterestTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InterestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *interestNumLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *liveCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *followingButton;

@end

NS_ASSUME_NONNULL_END

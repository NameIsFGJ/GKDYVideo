//
//  MyFansTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyFansTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *head_pic;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *followingButton;

@end

NS_ASSUME_NONNULL_END

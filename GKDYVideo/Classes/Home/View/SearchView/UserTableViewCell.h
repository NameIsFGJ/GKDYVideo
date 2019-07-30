//
//  UserTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchUserData;
NS_ASSUME_NONNULL_BEGIN

@interface UserTableViewCell : UITableViewCell
@property (strong, nonatomic)UIImageView *iconImageView;
@property (strong, nonatomic)UILabel *userNameLabel;
@property (strong, nonatomic)UIImageView *userSexImageView;
@property (strong, nonatomic)UIButton *followingButton;
@property (strong, nonatomic)SearchUserData *model;
@end

NS_ASSUME_NONNULL_END

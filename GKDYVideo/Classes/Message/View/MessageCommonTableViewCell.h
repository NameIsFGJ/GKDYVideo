//
//  MessageCommonTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GetZanModel;
NS_ASSUME_NONNULL_BEGIN

@interface MessageCommonTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *head_pic;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *send_time;
@property (weak, nonatomic) IBOutlet UIImageView *pic_url;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (strong, nonatomic)GetZanModel *model;
@end

NS_ASSUME_NONNULL_END

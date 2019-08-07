//
//  EditTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/7.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;
NS_ASSUME_NONNULL_BEGIN

@interface EditTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *pushButton;
@property (strong, nonatomic) DataModel *model;
@end

NS_ASSUME_NONNULL_END

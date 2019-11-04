//
//  NewExpressTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN




@interface NewExpressTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *exImageView;
@property (weak, nonatomic) IBOutlet UILabel *exYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *exTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *exLineView;
@property (weak, nonatomic) IBOutlet UILabel *expressInfoLabel;

@end

NS_ASSUME_NONNULL_END

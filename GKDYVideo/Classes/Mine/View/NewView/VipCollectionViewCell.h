//
//  VipCollectionViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VipCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodDesLabel;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;

@end

NS_ASSUME_NONNULL_END

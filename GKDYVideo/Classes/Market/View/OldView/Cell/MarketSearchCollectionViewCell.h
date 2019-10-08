//
//  MarketSearchCollectionViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/20.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MarketSearchCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *searchLabel;
@property (weak, nonatomic) IBOutlet UIGestureRecognizer *tapLabelGesture;

@end

NS_ASSUME_NONNULL_END

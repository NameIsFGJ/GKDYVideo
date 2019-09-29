//
//  VideoCollectionViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchVideoModel;
NS_ASSUME_NONNULL_BEGIN

@interface VideoCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic)UIImageView *videoImageView;
@property (strong, nonatomic)SearchVideoModel *model;
@end

NS_ASSUME_NONNULL_END

//
//  FollowingCollectionViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VideoModel;
NS_ASSUME_NONNULL_BEGIN

@interface FollowingCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic)UIImageView *pictureImageView;
@property (strong, nonatomic)VideoModel *model;
@end

NS_ASSUME_NONNULL_END

//
//  MusicsTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MusicModel;
@class MusicsTableViewCell;

@protocol ButtonClickDelegate <NSObject>

- (void)pauseButtonAction:(MusicsTableViewCell *_Nullable)cell;

@end


NS_ASSUME_NONNULL_BEGIN

@interface MusicsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UIButton *useButton;
@property (weak, nonatomic) id<ButtonClickDelegate> delegate;
@property (strong, nonatomic) MusicModel *model;
//@property (weak, nonatomic) id<UserViewDelegaete> delegate;

@end

NS_ASSUME_NONNULL_END

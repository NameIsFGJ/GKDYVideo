//
//  GetVideoCommentView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GetVideoCommentView : UIView

@property (assign, nonatomic)NSInteger nowPage;
@property (strong, nonatomic)IndexModel *model;
- (instancetype)initWithFrame:(CGRect)frame AndModel:(IndexModel *)model;

- (void)showView;
- (void)missView;
@end


NS_ASSUME_NONNULL_END

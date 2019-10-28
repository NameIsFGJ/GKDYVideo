//
//  GoodDetailView1.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GoodDetailView1Delegate <NSObject>

- (void)view1WithCommentView;

@end
@interface GoodDetailView1 : UIView
@property (nonatomic, weak) id<GoodDetailView1Delegate> delegate;
@end

NS_ASSUME_NONNULL_END

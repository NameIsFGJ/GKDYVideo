//
//  GoodDetailView3.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GoodDetailView3Delegate <NSObject>

- (void)view3WithCollectionViewClick:(NSInteger)index;

@end
@interface GoodDetailView3 : UIView

@property (nonatomic, weak) id<GoodDetailView3Delegate> delegate;

@end

NS_ASSUME_NONNULL_END

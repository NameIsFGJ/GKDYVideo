//
//  GoodDetailView0.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GoodDetailView0Delegate <NSObject>
- (void)view0WithBannerClick:(NSInteger)index;
- (void)view0WithMemberClick;
- (void)view0WithDiscountClick;
- (void)view0WithShopClick;
@end


@interface GoodDetailView0 : UIView
@property (nonatomic, weak) id<GoodDetailView0Delegate> delegate;
@end

NS_ASSUME_NONNULL_END

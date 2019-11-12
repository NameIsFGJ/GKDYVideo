//
//  ShopTypeView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ShopTypeViewDelegate <NSObject>

- (void)typeViewWithIndex:(NSInteger)buttonIndex;

@end

@interface ShopTypeView : UIView
@property (weak, nonatomic) id <ShopTypeViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END

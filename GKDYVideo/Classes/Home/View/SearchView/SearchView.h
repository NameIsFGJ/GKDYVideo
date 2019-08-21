//
//  SearchView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchView : UIView
@property (strong, nonatomic)UITextField *searchTextField;
@property (strong, nonatomic)UIImageView *searchImageView;
@property (strong, nonatomic)UIView *lineView;
@property (strong, nonatomic)UIButton *cleanSearchButton;
@end

NS_ASSUME_NONNULL_END

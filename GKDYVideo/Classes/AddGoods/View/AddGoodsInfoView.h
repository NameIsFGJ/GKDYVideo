//
//  AddGoodsInfoView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, InfoViewType){
    pushViewControllerType,
    infoViewControllerType
};

NS_ASSUME_NONNULL_BEGIN

@interface AddGoodsInfoView : UIView
@property (strong, nonatomic)UILabel *titleLabel;
@property (strong, nonatomic)UIButton *pushButton;
@property (strong, nonatomic)UITextField *infoTextField;

- (instancetype)initWithFrame:(CGRect)frame AndWithViewType:(InfoViewType)type;
@end
NS_ASSUME_NONNULL_END

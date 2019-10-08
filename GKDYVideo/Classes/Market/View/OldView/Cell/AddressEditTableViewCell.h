//
//  AddressEditTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddressListModel;
@class AddressEditTableViewCell;
NS_ASSUME_NONNULL_BEGIN

@protocol CellButtonDelegate <NSObject>

- (void)clickCellButtonAction:(UIButton *)button;

@end

@interface AddressEditTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userAddressLabel;
@property (weak, nonatomic) IBOutlet UIButton *addressEditButton;
@property (weak, nonatomic) id<CellButtonDelegate> delegate;
@property (strong, nonatomic) AddressListModel *model;

@end

NS_ASSUME_NONNULL_END

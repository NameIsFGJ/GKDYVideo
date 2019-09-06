//
//  AddressEditTableViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressEditTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userAddressLabel;
@property (weak, nonatomic) IBOutlet UIButton *addressEditButton;

@end

NS_ASSUME_NONNULL_END

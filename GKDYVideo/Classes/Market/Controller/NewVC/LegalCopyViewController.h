//
//  LegalCopyViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"



NS_ASSUME_NONNULL_BEGIN
typedef void(^LegalHeaderBlock)(BOOL);
@interface LegalCopyViewController : BaseViewController
@property (copy, nonatomic) LegalHeaderBlock block;

@end

NS_ASSUME_NONNULL_END

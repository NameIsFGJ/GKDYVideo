//
//  EditViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController
@property (strong, nonatomic) NSDictionary *settings;
@property (strong, nonatomic) NSArray *filesURLArray;
@property (strong, nonatomic) AVPlayerItem *playerItem;
@end

NS_ASSUME_NONNULL_END

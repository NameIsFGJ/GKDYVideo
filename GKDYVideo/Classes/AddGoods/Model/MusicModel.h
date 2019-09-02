//
//  MusicModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicModel : NSObject
@property (assign, nonatomic)NSInteger ide;
@property (strong, nonatomic)NSString *name;
@property (assign, nonatomic)NSInteger is_show;
@property (strong, nonatomic)NSString *music_url;
@property (strong, nonatomic)NSString *create_time_text;
@property (strong, nonatomic)NSString *update_time_text;
@property (strong, nonatomic)NSString *delete_time_text;
@property (assign, nonatomic)BOOL isSelected;

@end

NS_ASSUME_NONNULL_END

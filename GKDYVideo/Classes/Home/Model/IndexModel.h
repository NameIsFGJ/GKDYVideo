//
//  IndexModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/17.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IndexModel : NSObject
@property (assign, nonatomic) NSInteger identify;
@property (assign, nonatomic) NSInteger u_id;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *pic_url;
@property (strong, nonatomic) NSString *video_url;
@property (assign, nonatomic) NSInteger z_count;
@property (assign, nonatomic) NSInteger c_count;
@property (assign, nonatomic) NSInteger share_count;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *head_pic;
@property (assign, nonatomic) NSInteger is_like;
@end

NS_ASSUME_NONNULL_END

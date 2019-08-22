//
//  MarketUserShopModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RowsModel : NSObject
@property (assign, nonatomic) NSInteger ide;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *original_price;
@property (strong, nonatomic)NSString *price;
@property (strong, nonatomic)NSString *cover;
@property (assign, nonatomic)NSInteger imageheight;
@property (assign, nonatomic)NSInteger imagewidth;
@property (assign, nonatomic)NSInteger sale_count;
@end

@interface MarketUserShopModel : NSObject
@property (assign, nonatomic)NSInteger total;
@property (assign, nonatomic)NSInteger per_page;
@property (strong, nonatomic)NSString *current_page;
@property (strong, nonatomic)NSArray<RowsModel *>*rows;

@end

NS_ASSUME_NONNULL_END

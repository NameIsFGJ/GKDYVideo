//
//  MarketModel.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdListModel : NSObject
@property (assign, nonatomic)NSInteger ide;
@property (assign, nonatomic)NSInteger category_id;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *link;
@property (strong, nonatomic)NSString *image;
@property (assign, nonatomic)NSInteger is_show;
@property (assign, nonatomic)NSInteger weigh;
@end

@interface CategoryModel : NSObject
@property (assign, nonatomic)NSInteger ide;
@property (assign, nonatomic)NSInteger pid;
@property (strong, nonatomic)NSString *type;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *nickname;
@property (strong, nonatomic)NSString *flag;
@property (strong, nonatomic)NSString *image;
@property (strong, nonatomic)NSString *keywords;
@property (strong, nonatomic)NSString *descriptionS;
@property (strong, nonatomic)NSString *diyname;
@property (assign, nonatomic)NSInteger createtime;
@property (assign, nonatomic)NSInteger updatetime;
@property (assign, nonatomic)NSInteger weigh;
@property (strong, nonatomic)NSString *status;
@property (strong, nonatomic)NSString *type_text;
@property (strong, nonatomic)NSString *flag_text;

@end

@interface HotGoodsModel : NSObject
@property (assign, nonatomic)NSInteger ide;
@property (strong, nonatomic)NSString *price;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *cover;
@end

@interface HotRentModel : NSObject
@property (assign, nonatomic)NSInteger ide;
@property (strong, nonatomic)NSString *price;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *cover;
@end

@interface MarketModel : NSObject
@property (strong, nonatomic)NSArray <AdListModel *>*ad_list;
@property (strong, nonatomic)NSArray <CategoryModel *>*category;
@property (strong, nonatomic)NSArray <HotGoodsModel *>*hot_goods;
@property (strong, nonatomic)NSArray <HotRentModel *>*hot_rent;
@end

NS_ASSUME_NONNULL_END

//
//  TypeView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/28.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TypeView;
@protocol TypeViewSelectDelegate <NSObject>

- (void)btnIndexTypeView:(TypeView *)view buttonTag:(int)tag;

@end


@interface TypeView : UIView
@property (weak, nonatomic) id<TypeViewSelectDelegate> delegate;
@property (assign,nonatomic)int seletIndex;
@property (assign, nonatomic) int btnTag;
-(instancetype)initWithDatasource:(NSArray *)arr andTitleName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

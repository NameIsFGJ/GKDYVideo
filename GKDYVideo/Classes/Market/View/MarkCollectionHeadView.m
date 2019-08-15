//
//  MarkCollectionHeadView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarkCollectionHeadView.h"
@interface MarkCollectionHeadView()

@property (strong, nonatomic)UIView *bannerView;
@property (strong, nonatomic)UIView *buttonView;


@end
@implementation MarkCollectionHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bannerView = [[UIView alloc]init];
        [self addSubview:self.bannerView];
        self.bannerView.backgroundColor = [UIColor redColor];
        [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(212);
        }];
        
         self.buttonView = [[UIView alloc]init];
        [self addSubview:self.buttonView];
        [self.buttonView setBackgroundColor:[UIColor blueColor]];
        [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.equalTo(self.bannerView.mas_bottom);
            
        }];
    }
    return self;
}
@end

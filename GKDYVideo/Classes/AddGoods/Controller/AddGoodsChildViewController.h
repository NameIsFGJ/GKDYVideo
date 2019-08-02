//
//  AddGoodsChildViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/31.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseAddGoodsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddGoodsChildViewController : BaseAddGoodsViewController

@end
/*
 UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
 [self.view addSubview:scrollView];
 
 UIView * containView = [[UIView alloc] init];
 containView.backgroundColor = [UIColor greenColor];
 [scrollView addSubview:containView];
 
 UIView *headView = [[UIView alloc]init];
 headView.backgroundColor = [UIColor blueColor];
 [containView addSubview:headView];
 
 UIView *bottomView = [[UIView alloc]init];
 bottomView.backgroundColor = [UIColor redColor];
 [containView addSubview:bottomView];
 
 //    [scrollView mas_makeConstraints:^(MASConstraintMaker *make){
 //        make.edges.mas_equalTo(UIEdgeInsetsZero);
 //    }];
 
 [containView mas_makeConstraints:^(MASConstraintMaker *make) {
 make.edges.equalTo(scrollView);
 make.width.equalTo(scrollView);
 }];
 
 
 [headView mas_makeConstraints:^(MASConstraintMaker *make) {
 make.left.right.top.mas_equalTo(0);
 make.height.mas_equalTo(880);
 }];
 
 
 [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
 make.left.right.equalTo(headView);
 make.top.equalTo(headView.mas_bottom).offset(20);
 make.height.mas_equalTo(900);
 }];
 */
NS_ASSUME_NONNULL_END

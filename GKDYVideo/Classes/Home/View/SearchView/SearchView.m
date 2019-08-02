//
//  SearchView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHex:@"#999999"];
        self.layer.cornerRadius = 2.5f;
        self.layer.masksToBounds = YES;
    
        UIImageView *searchImageView = [[UIImageView alloc]init];
        [self addSubview:searchImageView];
        searchImageView.frame = CGRectMake(10,12, 15, 15);
        
        searchImageView.image = [UIImage imageNamed:@"search"];
        //rame:CGRectMake(22, 15, 1, 10)];
        UIView *lineView = [[UIView alloc]init];
        [self addSubview:lineView];
        lineView.frame = CGRectMake(CGRectGetMaxX(searchImageView.frame)+ 5, 12, 1, 15);
        lineView.backgroundColor = kWhiteColor;
        
        self.searchTextField = [[UITextField alloc]init];
        [self addSubview:self.searchTextField];
        self.searchTextField.frame = CGRectMake(CGRectGetMaxX(lineView.frame)+10, 12, 150, 12);
        self.searchTextField.placeholder = @"搜索您要找的内容";
        [self.searchTextField setValue:[UIFont boldSystemFontOfSize:14.f] forKeyPath:@"_placeholderLabel.font"];
        self.searchTextField.font = kFontSize(14);
        UIButton *cleanSearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cleanSearchButton.frame = CGRectMake(240, 12, 15, 15);
        [self addSubview:cleanSearchButton];
        [cleanSearchButton setImage:[UIImage imageNamed:@"closeLoginVC"] forState:UIControlStateNormal];
        [cleanSearchButton addTarget:self action:@selector(cleanSearchButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)cleanSearchButtonAction
{
    self.searchTextField.text = @"";
    self.searchTextField.placeholder = @"搜索您要找的内容";
}

@end

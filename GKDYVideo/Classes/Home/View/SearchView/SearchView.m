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
    
        self.searchImageView = [[UIImageView alloc]init];
        [self addSubview:self.searchImageView];
        self.searchImageView.frame = CGRectMake(10,12, 15, 15);
        
        self.searchImageView.image = [UIImage imageNamed:@"search"];
        //rame:CGRectMake(22, 15, 1, 10)];
        self.lineView = [[UIView alloc]init];
        [self addSubview:self.lineView];
        self.lineView.frame = CGRectMake(CGRectGetMaxX(self.searchImageView.frame)+ 5, 12, 1, 15);
        self.lineView.backgroundColor = kWhiteColor;
        
        self.searchTextField = [[UITextField alloc]init];
        [self addSubview:self.searchTextField];
        self.searchTextField.frame = CGRectMake(CGRectGetMaxX(self.lineView.frame)+10, 12, 150, 12);
        self.searchTextField.placeholder = @"搜索您要找的内容";
        [self.searchTextField setValue:[UIFont boldSystemFontOfSize:14.f] forKeyPath:@"_placeholderLabel.font"];
        self.searchTextField.font = kFontSize(14);
        self.cleanSearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cleanSearchButton.frame = CGRectMake(240, 12, 15, 15);
        [self addSubview:self.cleanSearchButton];
        [self.cleanSearchButton setImage:[UIImage imageNamed:@"closeLoginVC"] forState:UIControlStateNormal];
        [self.cleanSearchButton addTarget:self action:@selector(cleanSearchButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)cleanSearchButtonAction
{
    self.searchTextField.text = @"";
    self.searchTextField.placeholder = @"搜索您要找的内容";
}

@end

//
//  GoodDetailDisCountView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GoodDetailDisCountView.h"
#import "DisCountTableViewCell.h"

static NSInteger viewHeight = 409;

@interface GoodDetailDisCountView()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UITableView *mainView;

@end

@implementation GoodDetailDisCountView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIView *bgView = [[UIView alloc]init];
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(kWindowHeight-viewHeight);
            
        }];
        bgView.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
        
        
        self.contentView = [[UIView alloc]init];
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-kWindowHeight+viewHeight);
            make.height.mas_equalTo(viewHeight);
        }];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UILabel *label0 = [[UILabel alloc]init];
        [self.contentView addSubview:label0];
        [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
      //  label0.backgroundColor = [UIColor blueColor];
        label0.text = @"优惠";
        label0.textAlignment = NSTextAlignmentCenter;
        label0.textColor = [UIColor blackColor];

        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:closeButton];
        
        [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.centerY.equalTo(label0.mas_centerY);
        }];
        [closeButton setImage:[UIImage imageNamed:@"yhq_close"] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(tapButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.mainView];
        [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(250);
            make.left.right.mas_equalTo(0);
            make.top.equalTo(label0.mas_bottom).offset(5);
        }];
        
        UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:submitButton];
        [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.left.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        [submitButton setTitle:@"确定" forState:UIControlStateNormal];
        [submitButton setBackgroundColor:kPickColor];
        [submitButton addTarget:self action:@selector(getDisCount) forControlEvents:UIControlEventTouchUpInside];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapButtonAction)];
        
        [bgView addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)animation
{
    [UIView animateWithDuration:5 animations:^{
        [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(viewHeight);
        }];
    }];
}

- (void)tapButtonAction
{
    self.hidden = YES;
}


- (void)getDisCount
{
    [self tapButtonAction];
    NSLog(@"点击确定");
}

#pragma mark UITableViewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"DisCountTableViewCellID";
    DisCountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark lazyLoad
- (UITableView *)mainView
{
    if (!_mainView) {
        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_mainView registerNib:[UINib nibWithNibName:@"DisCountTableViewCell" bundle:nil] forCellReuseIdentifier:@"DisCountTableViewCellID"];
        _mainView.delegate = self;
        _mainView.dataSource = self;
    }
    return _mainView;
}
@end

//
//  GoodDetailView1.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GoodDetailView1.h"
#import "NewGoodCommentTableViewCell.h"

@interface GoodDetailView1()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *mainView;
@property (strong, nonatomic) NSMutableArray *itemsArray;
@end

@implementation GoodDetailView1
- (instancetype)init
{
    self = [super init];
    
    UIView *view0 = [[UIView alloc]init];
    [self addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    UITapGestureRecognizer *tap0 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushCommentView)];
    [view0 addGestureRecognizer:tap0];
    
    UILabel *label00 = [[UILabel alloc]init];
    [view0 addSubview:label00];
    [label00 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.equalTo(view0.mas_centerY);
    }];
    label00.text = @"点评(211)";
    label00.textColor = [UIColor blackColor];
    label00.font = kFontSize(15);
    
    UILabel *label01 = [[UILabel alloc]init];
    [view0 addSubview:label01];
    [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.equalTo(view0.mas_centerY);
    }];
    label01.text = @"好评率 85% >";
    label01.textColor = [UIColor blackColor];
    label01.font = kFontSize(15);
    
    [self addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom);
        make.height.mas_equalTo(2*230);
    }];
    
    return self;
}

- (void)pushCommentView
{
    if ([self.delegate respondsToSelector:@selector(view1WithCommentView)]) {
        [self.delegate view1WithCommentView];
    }
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"NewGoodCommentTableViewCellID";
    NewGoodCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 230;
}

#pragma mark lazyLoad
- (UITableView *)mainView
{
    if (!_mainView) {
        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        _mainView.scrollEnabled = NO;
        [_mainView registerNib:[UINib nibWithNibName:@"NewGoodCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewGoodCommentTableViewCellID"];
    }
    return _mainView;
}

@end

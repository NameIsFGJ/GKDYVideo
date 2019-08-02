//
//  GetVideoCommentView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GetVideoCommentView.h"
#import "GetVideoCommentCell.h"
#import "GetVideoCommentNetworking.h"
@interface GetVideoCommentView()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UIView *contentView;
@property (strong, nonatomic)UIView *clearView;
@property (strong, nonatomic)UIView *headView;
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)UILabel *titleLabel;
@property (strong, nonatomic)UIButton *closeButton;
@property (strong, nonatomic)UITextField *messageTextField;
@property (strong, nonatomic)UIView *footView;
@property (strong, nonatomic)NSMutableArray *itemsArray;

@end
@implementation GetVideoCommentView

- (instancetype)initWithFrame:(CGRect)frame AndModel:(IndexModel *)model;
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.model = model;
        [self creatUI];
        [self networking];
    
    }
    return self;
}

#pragma mark Action

- (void)creatUI
{
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.contentView addSubview:self.clearView];
    self.clearView.backgroundColor = [UIColor clearColor];
    [self.clearView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.height.mas_equalTo(124);
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(missView)];
    [self.clearView addGestureRecognizer:tap];
    
    [self.contentView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.clearView.mas_bottom);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(40);
    }];
    
    [self.headView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.center.equalTo(self.headView);
    }];
    [self.headView addSubview:self.closeButton];
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [self.contentView addSubview:self.footView];
    self.footView.backgroundColor = [UIColor colorWithHex:@"#4B4B4B" alpha:1];
    [self.footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(49);
    }];
    [self.footView addSubview:self.messageTextField];
    [self.messageTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        // make.edges.mas_equalTo(self.footView);
        make.left.right.mas_equalTo(10);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [self.contentView addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.equalTo(self.headView.mas_bottom).offset(0);
        make.bottom.equalTo(self.footView.mas_top).offset(0);
    }];
}
- (void)networking
{
    [GetVideoCommentNetworking postGetVideoComment:1 userID:[kUser.user_id integerValue] videoID:self.model.identify completion:^(GetVideoCommentModel * _Nonnull model, NSError * _Nonnull error) {
        NSLog(@"model.num  =%ld",model.num);
    }];
}

- (void)showView;
{
    [UIView animateWithDuration:.25f animations:^{
        CGRect frame  = self.frame;
        frame.origin.y = 0;
        self.frame = frame;
    }];
}

- (void)missView;
{

    [UIView animateWithDuration:.25f animations:^{
        CGRect frame  = self.frame;
                frame.origin.y = kWindowHeight;
                self.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

#pragma mark --lazy load

- (UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [[UIView alloc]init];
    }
    return _contentView;
}

- (UIView *)clearView
{
    if (!_clearView)
    {
        _clearView = [[UIView alloc]init];
    }
    return _clearView;
}

- (UIView *)headView
{
    if (!_headView)
    {
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = [UIColor colorWithHex:@"#222934" alpha:1];
        _headView.layer.cornerRadius = 3;
        _headView.layer.masksToBounds = YES;
    }
    return _headView;
}

- (UIView *)footView
{
    if (!_footView)
    {
        _footView = [[UIView alloc]init];
    }
    return _footView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray)
    {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[GetVideoCommentCell class] forCellReuseIdentifier:@"GetVideoCommentCellID"];
    }
    return _tableView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = kWhiteColor;
        _titleLabel.font = kFontSize(14);
        _titleLabel.text = @"553条评论";
    }
    return _titleLabel;
}

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(missView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UITextField *)messageTextField
{
    if (!_messageTextField)
    {
        _messageTextField = [[UITextField alloc]init];
        _messageTextField.text = @" 喜欢就说点啥~";
        _messageTextField.font = kFontSize(13);
    }
    return _messageTextField;
}
@end

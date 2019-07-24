//
//  GetVideoCommentView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GetVideoCommentView.h"
#import "GetVideoCommentCell.h"
@interface GetVideoCommentView()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)UIView *headView;
@property (strong, nonatomic)UILabel *titleLabel;
@property (strong, nonatomic)UIButton *closeButton;
@property (strong, nonatomic)UITextField *messageTextField;
@property (strong, nonatomic)UIView *footView;
@property (strong, nonatomic)NSMutableArray *itemsArray;

@end
@implementation GetVideoCommentView


- (instancetype)initWithVideoCommentView:(NSInteger )video_id userID:(NSInteger)uid;
{
    self = [super init];
    [self addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self);
        make.height.mas_equalTo(40);
    }];
    
    [self addSubview:self.tableView];
    [self.footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(40);
    }];
    [self addSubview:self.footView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.equalTo(self.headView.mas_bottom).offset(0);
        make.bottom.equalTo(self.footView.mas_top).offset(0);
    }];
    return self;
}

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

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = [UIColor grayColor];
    }
    return _headView;
}

- (UIView *)footView
{
    if (!_footView) {
        _footView = [[UIView alloc]init];
        _footView.backgroundColor = [UIColor redColor];
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
@end

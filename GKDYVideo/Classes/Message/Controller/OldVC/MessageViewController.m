//
//  MessageViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "MessageHeadView.h"
#import "MyfriendsViewController.h"
@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@end

@implementation MessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self creatNav];
    
    [self creatTableView];
}

- (void)creatNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"消息";
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"myFriends"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(pushMyFriendsVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
- (void)creatTableView
{
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    MessageHeadView *view = [[MessageHeadView alloc]init];
    view.frame = CGRectMake(0, 0, kWindowWidth, 114);
    self.tableView.tableHeaderView = view;
    self.tableView.backgroundColor = kMainColor;
}

- (void)pushMyFriendsVC
{
    MyfriendsViewController *vc = [[MyfriendsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCellID" forIndexPath:indexPath];
    return cell;
}

#pragma mark 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageTableViewCellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 114;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

@end




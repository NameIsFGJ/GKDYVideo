//
//  SearchUserViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchUserViewController.h"
#import "UserTableViewCell.h"
#import "SearchUsersNetworking.h"
@interface SearchUserViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SearchUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self makeUI];
    [self networking];
    
}

- (void)makeUI
{
    // self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.backgroundColor = kMainColor
    
}

- (void)networking
{

}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"UserTableViewCellID";
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.itemArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma mark 懒加载
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView  alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UserTableViewCell class] forCellReuseIdentifier:@"UserTableViewCellID"];
    }
    return _tableView;
}

- (NSMutableArray *)itemArray
{
    if (!_itemArray)
    {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

@end

//
//  MyfriendsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyfriendsViewController.h"
#import "MyFriendTableViewCell.h"
@interface MyfriendsViewController()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@end

@implementation MyfriendsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self makeUI];
}

- (void)makeUI
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"粉丝";
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    NSLog(@"self.itemsArray.count  =%ld",self.itemsArray.count);
    return 5;
    // return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"MyFriendTableViewCellID";
    MyFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // cell.model = self.itemsArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

#pragma mark 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"MyFriendTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyFriendTableViewCellID"];
        _tableView.backgroundColor = kMainColor;
    }
    return _tableView;
}

@end

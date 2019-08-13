//
//  IssueViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "IssueViewController.h"
#import "IssueTableViewCell.h"
@interface IssueViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *itemsArray;
@end

@implementation IssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
}
#pragma mark  Action
- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"我的发布";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //fenxiang
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushViewController
{
    NSLog(@"分享");
}
- (void)makeUI
{
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"IssueTableViewCellID";
    
    IssueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     //cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

#pragma mark 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"IssueTableViewCell" bundle:nil] forCellReuseIdentifier:@"IssueTableViewCellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSArray arrayWithObjects:@"昵称",@"漫饭号",@"签名",@"性别",@"生日",@"地区", nil];
    }
    return _itemsArray;
}
@end

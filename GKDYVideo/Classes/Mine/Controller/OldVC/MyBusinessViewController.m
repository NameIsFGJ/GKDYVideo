//
//  MyBusinessViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyBusinessViewController.h"
#import "MyBusinessTableViewCell.h"
#import "MyBusinessNetworking.h"
#import "MySellTableViewCell.h"
#import "MyBuyTableViewCell.h"
@interface MyBusinessViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray *itemsArray;

@end

@implementation MyBusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
    [self networking];
}

#pragma mark Action
- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"我卖出的";
    if (self.type == sellTyle)
    {
        label.text = @"我卖出的";
    }else if (self.type == buyType)
    {
        label.text = @"我买到的";
    }
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    [self.view addSubview:self.tableView];
    if (self.status == pushVC) {
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(64);
            make.left.right.bottom.mas_equalTo(0);
        }];
    }else if (self.status == sonVC){
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
}

- (void)networking
{
    [MyBusinessNetworking postMyBusinessWithToken:kUser.user_token withPage:1 withType:self.type completion:^(NSMutableArray * _Nonnull array, NSError * _Nonnull error) {
        NSLog(@"array.count34  =%ld",array.count);
        self.itemsArray = array;
        [self.tableView reloadData];
    }];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *sellID = @"MySellTableViewCellID";
    static NSString *buyID = @"MyBuyTableViewCellID";
    
    //我卖出的
    if (self.type == sellTyle)
    {
        MySellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sellID forIndexPath:indexPath];
        cell.model = self.itemsArray[indexPath.row];
        return cell;
        //我买到的
    }else if (self.type == buyType)
    {
        MyBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buyID forIndexPath:indexPath];
        cell.model = self.itemsArray[indexPath.row];
        return cell;
    }
    
    return nil;
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
        [_tableView registerNib:[UINib nibWithNibName:@"MySellTableViewCell" bundle:nil] forCellReuseIdentifier:@"MySellTableViewCellID"];
        [_tableView registerNib:[UINib nibWithNibName:@"MyBuyTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyBuyTableViewCellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

@end
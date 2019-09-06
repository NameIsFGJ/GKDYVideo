//
//  AddressEditViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressEditViewController.h"
#import "AddressEditTableViewCell.h"
#import "AddressNetworking.h"
@interface AddressEditViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@end

@implementation AddressEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeNav];
    [self makeUI];
    [self networking];
}

#pragma mark Actions
- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"编辑地址";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(pushNewAddressAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushNewAddressAction
{
    NSLog(@"添加新的地址");
}

- (void)makeUI
{
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
}

- (void)networking
{
    [AddressNetworking postAddressListWithToken:kUser.user_token withPage:1 completion:^(NSArray * _Nonnull array, NSError * _Nonnull error) {
     //  self.itemsArray
    }];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    return nil;
}

#pragma mark 懒加载
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"AddressEditTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddressEditTableViewCellID"];
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

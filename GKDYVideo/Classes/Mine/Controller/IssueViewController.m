//
//  IssueViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "IssueViewController.h"
#import "IssueTableViewCell.h"
#import "MyGoodsNetworking.h"
#import "DeleGoodsNetworking.h"
#import "MyGoodsModel.h"

@interface IssueViewController ()<UITableViewDelegate,UITableViewDataSource,IssueTableViewCellDeletgate>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@end

@implementation IssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
    [self networking];

}

#pragma mark  Action
- (void)networking
{
    [MyGoodsNetworking postIssueMyGoodsWithToken:kUser.user_token withPage:1 completion:^(NSMutableArray * _Nonnull array, NSError * _Nonnull error) {
        self.itemsArray = array;
        [self.tableView reloadData];
    }];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"我的发布";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    NSLog(@"kUser.user_token  =%@",kUser.user_token);
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
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
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
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.itemsArray[indexPath.row];
    
    cell.deleteButton.tag = 100+ indexPath.row;
    cell.editButton.tag = 200+ indexPath.row;
    cell.shareButton.tag = 300+ indexPath.row;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

#pragma mark cellDelegate
// 删除
- (void)deleteButtonActionFromCell:(UIButton *)button;
{
    MyGoodsModel *model = self.itemsArray[button.tag - 100];
    
    [DeleGoodsNetworking postDeleGoodNetworkingWithToken:kUser.user_token withGoodID:model.ide completion:^(NSInteger code, NSError * _Nonnull error) {
        if (code == 1) {
            [self.itemsArray removeAllObjects];
            [self networking];
        }
    }];
}

// 编辑
- (void)editButtonActionFromCell:(UIButton *)button;
{
    MyGoodsModel *model = self.itemsArray[button.tag - 200];
    
    
    
    
    NSLog(@"编辑");
}

// 分享
- (void)shareButtonActionFromCell:(UIButton *)button;
{
     MyGoodsModel *model = self.itemsArray[button.tag - 200];
    NSLog(@"分享第%ld 个内容",model.ide);
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

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

@end

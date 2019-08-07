//
//  MineViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "MyIndexNetworking.h"
#import "SetViewController.h"
#import "MineHeadView.h"
#import "EditInfoViewController.h"


@interface MineViewController()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *imageArray;
@property (strong, nonatomic)NSMutableArray *titleArray;
@property (strong, nonatomic)MineHeadView *headView;
@property (strong, nonatomic)DataModel *model;

@end
@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:@"#222934"]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNav];
    [self creatTableView];
    [self networking];
    
}


- (void)creatNav
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"setImage"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(pushSetViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)creatTableView
{
    [self.view addSubview:self.tableView];
     self.headView = [[MineHeadView alloc]init];
    self.headView.frame = CGRectMake(0, 0, kWindowWidth, 160);
    self.tableView.tableHeaderView = self.headView;
}

- (void)networking
{
    NSLog(@"kUser.user_token  =%@",kUser.user_token);
    [MyIndexNetworking postMyIndex:kUser.user_token completionHandle:^(DataModel * _Nonnull model, NSError * _Nonnull error) {
        self.model = model;
        self.headView.nickNameLabel.text = model.nickname;
        self.headView.mfNumberLabel.text = model.mf_num;
        NSLog(@"model.head_pic  =%@",model.head_pic);
        [self.tableView reloadData];
       // self.headView.nickNameLabel.text = model.nickname;
    }];
}

#pragma mark Action
- (void)pushSetViewController
{
    EditInfoViewController *vc = [[EditInfoViewController alloc]init];
    vc.model = self.model;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    static NSString *cellID = @"MineTableViewCellID";
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.leftImageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.leftLabel.text = self.titleArray[indexPath.row];
    if (indexPath.row == 3) {
        cell.rightLabel.hidden = NO;
        cell.rightLabel.text = @"$100.00";
    }else{
        cell.rightLabel.hidden = YES;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3)
    {
        SetViewController *vc = [[SetViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark  loaz load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"MineTableViewCellID"];
    }
    return _tableView;
}

- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSMutableArray arrayWithObjects:@"my-fabu",@"my-order",@"my-order",@"my-money",@"my-play",@"my-save",@"my-service", nil];
    }
    return _imageArray;
}

- (NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray arrayWithObjects:@"我发布的",@"我卖出的",@"我买到的",@"我的钱包",@"我的视频",@"我的收藏",@"在线客服", nil];
    }
    return _titleArray;
}
@end

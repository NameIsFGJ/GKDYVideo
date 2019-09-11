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
// 设置
#import "EditInfoViewController.h"
// 我的发布
#import "IssueViewController.h"
//  我卖出的
#import "MyBusinessViewController.h"

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
   // self.navigationController seth
   // [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:@"#222934"]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self networking];
   // [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
  //  [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNav];
    [self creatTableView];
    
}


- (void)creatNav
{
}

- (void)creatTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.top.mas_equalTo(-KTopViewHeight);
    }];
    self.headView = [[MineHeadView alloc]init];
    self.headView.frame = CGRectMake(0, 0, kWindowWidth, 230);
    [self.headView.rightButton addTarget:self action:@selector(pushSetViewController) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = self.headView;
}

- (void)networking
{
    [MyIndexNetworking postMyIndex:kUser.user_token completionHandle:^(DataModel * _Nonnull model, NSError * _Nonnull error) {
        self.model = model;
        self.headView.nickNameLabel.text = model.nickname;
        self.headView.mfNumberLabel.text = model.mf_num;
        NSString *picUrl = [NSString stringWithFormat:@"%@%@",kSERVICE,model.head_pic];
        [self.headView.head_pic sd_setImageWithURL:[NSURL URLWithString:picUrl]];
        [self.tableView reloadData];
    }];
}

#pragma mark Action
- (void)pushSetViewController
{
    //EditInfoViewController *vc = [[EditInfoViewController alloc]init];
    //vc.model = self.model;
    SetViewController *vc = [[SetViewController alloc]init];
    vc.imageUrl = self.model.head_pic;
     vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    /*
     self.view.backgroundColor = kWhiteColor;
     kUser.user_token = @"";
     kUser.user_id = @"";
     kUser.mobile = @"";
     kUser.nickname = @"";
     kUser.head_pic = @"";
     kUser.money = @"";
     [self showNormalMsg:@"退出登录"];
     */
}

#pragma mark UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    static NSString *cellID = @"MineTableViewCellID";
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    // 我发布的
    if (indexPath.row == 0)
    {
        IssueViewController *vc = [[IssueViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        //  我买入的
    }else if (indexPath.row == 1)
    {
        MyBusinessViewController *vc =[[MyBusinessViewController alloc]init];
        vc.type = sellTyle;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        //   我买出的
    }else if (indexPath.row == 2)
    {
        MyBusinessViewController *vc =[[MyBusinessViewController alloc]init];
        vc.type = sellTyle;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
#pragma mark  loaz load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
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

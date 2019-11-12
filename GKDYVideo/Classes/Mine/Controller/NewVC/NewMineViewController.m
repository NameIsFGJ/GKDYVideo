//
//  NewMineViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMineViewController.h"
#import "NewMineView.h"
#import "MineTableViewCell.h"
// 会员中心
#import "MemberViewController.h"
// 设置
#import "NewSetViewController.h"
// 订单
#import "OrderMainViewController.h"
// 优惠券
#import "NewDiscountViewController.h"
// 余额
#import "BalanceViewController.h"
// 个人中心
#import "NewCenterViewController.h"
@interface NewMineViewController ()<UITableViewDelegate,UITableViewDataSource,MyHeadViewDelegate>

@property (strong, nonatomic) UITableView *mainView;
@property (strong, nonatomic) NewMineView *headView;
@property (strong, nonatomic) NSArray *titleArray;
@property (strong, nonatomic) NSArray *imageArray;

@end

@implementation NewMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //  [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(NAVBAR_HEIGHT, 0, 0, 0));
    }];
    
    self.headView = [[NewMineView alloc]init];
    self.headView.delegate = self;
    self.headView.frame = CGRectMake(0, 0, kWindowWidth, 460);
    self.mainView.tableHeaderView = self.headView;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"设置" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)rightButtonAction
{
    NewSetViewController *vc = [[NewSetViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"MineTableViewCellID";
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leftImageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.leftLabel.text = self.titleArray[indexPath.row];
    if (indexPath.row == 4) {
        cell.rightLabel.hidden = NO;
        cell.rightLabel.text = @"400-610-6998";
    }else{
        cell.rightLabel.hidden = YES;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollViewY = scrollView.contentOffset.y;
    if (scrollViewY > 0) {
        self.navigationItem.title = @"漫饭234";
    }else{
        self.navigationItem.title = @"";
    }
}

#pragma mark MyHeadViewDelegate
// 点击头像,进入个人中心
- (void)headViewCenterButtonClick;
{
    NewCenterViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewCenterViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
// 我的饭圈
- (void)headViewTopicButtonClick;
{
    NSLog(@"我的饭圈");
}
// 会员
- (void)headViewMemberButtonClick;
{   
    MemberViewController *vc = [[MemberViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
// 查看所有订单
- (void)headViewOrderAllButtonClick;
{
    NSLog(@"查看全部");
    OrderMainViewController *vc = [[OrderMainViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
// 待付款
- (void)headViewWaitPayButtonClick;
{
    NSLog(@"待付款");
    OrderMainViewController *vc = [[OrderMainViewController alloc]init];
    vc.selectIndex = 1;
    [self.navigationController pushViewController:vc animated:YES];
}
// 待发货
- (void)headViewWaitSendButtonClick;
{
    NSLog(@"待发货");
    OrderMainViewController *vc = [[OrderMainViewController alloc]init];
    vc.selectIndex = 2;
    [self.navigationController pushViewController:vc animated:YES];
}

// 待收货
- (void)headViewWaitReceiveButtonClick
{
    NSLog(@"待收货");
    OrderMainViewController *vc = [[OrderMainViewController alloc]init];
    vc.selectIndex = 3;
   
    [self.navigationController pushViewController:vc animated:YES];
}
// 待评价
- (void)headViewWaitDiscussButtonClick;
{
    NSLog(@"待评价");
    OrderMainViewController *vc = [[OrderMainViewController alloc]init];
    vc.selectIndex = 4;
    [self.navigationController pushViewController:vc animated:YES];
}
// 售后
- (void)headViewServeButtonClick;
{
    NSLog(@"退货/售后");
}
// 余额
- (void)headViewMoneyButtonClick;
{
    NSLog(@"余额");
    BalanceViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"BalanceViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
// 红包
- (void)headViewRedPacketButtonClick;
{
    NSLog(@"红包");
}
// 优惠券
- (void)headViewDiscountButtonClick;
{
    NSLog(@"优惠券");
    NewDiscountViewController *vc = [[NewDiscountViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)setupTarbarHidden
{
    return NO;
}
#pragma mark LazyLoad
- (UITableView *)mainView
{
    if (!_mainView) {
        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_mainView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"MineTableViewCellID"];
        _mainView.delegate = self;
        _mainView.dataSource = self;
    }
    return _mainView;
}

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"我的收藏",@"我的打赏",@"我的晒单",@"历史记录",@"客服专线", nil];
    }
    return _titleArray;
}

- (NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSArray arrayWithObjects:@"sc_iocn",@"ds_icom",@"sd_icon",@"lis_icon",@"kf_icon", nil];
    }
    return _imageArray;
}

@end

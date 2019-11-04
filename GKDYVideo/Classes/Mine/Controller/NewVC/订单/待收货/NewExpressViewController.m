//
//  NewExpressViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewExpressViewController.h"
#import "NewExpressTableViewCell.h"
#import "NewExpressView.h"

@interface NewExpressViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *itemsArray;
@property (strong, nonatomic) UITableView *mainView;

@end

@implementation NewExpressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    self.view.backgroundColor = kWhiteColor;
    
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
    self.navigationItem.title = @"物流快递";
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        // NSLog(@"KTopViewHeight  =%f",KTopViewHeight);
    }];
    
    NewExpressView *headView = [[NewExpressView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 100)];
    self.mainView.tableHeaderView = headView;
}
#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"NewExpressTableViewCellID";
    
    NewExpressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (indexPath.row == 5) {
        cell.exLineView.hidden = YES;
    }
    
    NSArray *titleArr = [NSArray arrayWithObjects: @"[收货地址]快件已被27号楼e站代签收",
                         @"[北京通州区杨庄公司锦园服务部]快件派送业务派送",
                         @"[北京通州区杨庄公司]到达目的地网店，快件将很快进行派送" ,
                         @"[北京通州区杨庄公司]进行派件扫描；派送业务员：周志军；联系电话：13522464946",
                         @"[北京分拨中心]在分拨中心进行卸车扫描",
                         @"[浙江杭州分拨中心]在分拨中心进行称重扫描",
                         @"[浙江杭州下城区三里亭公司]进行揽件扫描",nil];
    
    NSArray *timeArr = [NSArray arrayWithObjects:@"",
                        @"2017-07-04\n 12:59:00",
                        @"2017-07-03\n 10:59:00",
                        @"2017-07-03\n 08:22:00",
                        @"2017-07-03\n 03:34:22",
                        @"2017-07-02\n 12:59:00",
                        @"2017-07-02\n 08:10:00",nil];
    
    cell.exYearLabel.text = timeArr[indexPath.row];
    cell.expressInfoLabel.text = titleArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
//{
//    return 73;
//}
//
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
//{
//    static NSString *headViewID = @"NewExpressTestViewID";
//    _headView = [[NewExpressTestView alloc]initWithReuseIdentifier:headViewID];
//    return _headView;
//}

#pragma mark loazLoad

- (UITableView *)mainView
{
    if (!_mainView) {
        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_mainView registerNib:[UINib nibWithNibName:@"NewExpressTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewExpressTableViewCellID"];
       // [_mainView registerClass:[NewExpressTestView class] forHeaderFooterViewReuseIdentifier:@"NewExpressTestViewID"];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        
    }
    return _mainView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

@end

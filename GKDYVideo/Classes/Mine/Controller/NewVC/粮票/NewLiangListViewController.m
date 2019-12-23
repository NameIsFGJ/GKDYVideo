//
//  NewLiangListViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/12/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewLiangListViewController.h"
#import "GoldListTableViewCell.h"
@interface NewLiangListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *mainView;
@property (strong, nonatomic) NSMutableArray *itemsArray;

@end

@implementation NewLiangListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
}
- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"粮票";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
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
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(.3);
    }];
    lineView1.backgroundColor = [UIColor lightGrayColor];
    
}
#pragma mark UITableviewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"GoldListTableViewCellID";
    GoldListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

#pragma mark lazyload
- (UITableView *)mainView
{
    if (!_mainView) {
        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainView.delegate = self;
        _mainView.dataSource =self;
        [_mainView registerNib:[UINib nibWithNibName:@"GoldListTableViewCell" bundle:nil] forCellReuseIdentifier:@"GoldListTableViewCellID"];
    }
    return _mainView;
}


@end

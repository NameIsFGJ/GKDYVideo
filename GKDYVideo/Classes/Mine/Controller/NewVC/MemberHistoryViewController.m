//
//  MemberHistoryViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MemberHistoryViewController.h"
#import "MemberHistoryTableViewCell.h"
@interface MemberHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *mainView;

@end

@implementation MemberHistoryViewController

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
    label.text = @"购买记录";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)makeUI
{
    UIView *lineView = [[UIView alloc]init];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(.5);
    }];
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(lineView.mas_bottom);
        make.height.mas_equalTo(50);
    }];
    NSArray *titleArray = @[@"日期",@"金额"];
    for (int i = 0; i < 2; i ++) {
        UILabel *label = [[UILabel alloc]init];
        [view0 addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kWindowWidth/2 *i);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(kWindowWidth/2);
            make.bottom.mas_equalTo(0);
        }];
        
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        label.text = titleArray[i];
    }
    UIView *lineView1 = [[UIView alloc]init];
    [view0 addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view0);
        make.size.mas_equalTo(CGSizeMake(1, 20));
    }];
    lineView1.backgroundColor = [UIColor lightGrayColor];
    
    UIView *lineView2 = [[UIView alloc]init];
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom);
        make.height.mas_equalTo(8);
    }];
    lineView2.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.top.equalTo(lineView2.mas_bottom);
    }];
}
#pragma mark Actions
- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"MemberHistoryTableViewCellID";
    MemberHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark LazyLoad
- (UITableView *)mainView
{
    if (!_mainView) {
        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_mainView registerNib:[UINib nibWithNibName:@"MemberHistoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"MemberHistoryTableViewCellID"];
        _mainView.delegate = self;
        _mainView.dataSource = self;
    }
    return _mainView;
}

@end

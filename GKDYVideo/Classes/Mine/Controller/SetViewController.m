//
//  SetViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SetViewController.h"
#import "SetTableViewCell.h"
//  编辑个人资料
#import "EditInfoViewController.h"
//  实名认证
#import "IDCardViewController.h"
//  支付密码
#import "DealSetViewController.h"
@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong,nonatomic)UIButton *submitButton;

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"设置";
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
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(385);
    }];
    
    [self.view addSubview:self.submitButton];
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).offset(10);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
    }];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"SetTableViewCellID";
    SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLabel.text = self.itemsArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.headImageView.hidden = NO;
       [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kSERVICE,self.imageUrl]]];
    }else
    {
        cell.headImageView.hidden = YES;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        EditInfoViewController *vc = [[EditInfoViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1)
    {
        IDCardViewController *vc = [[IDCardViewController alloc]init];
         vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2)
    {
        DealSetViewController *vc = [[DealSetViewController alloc]init];
         vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3)
    {
        
    }else if (indexPath.row == 4)
    {
        
    }else if (indexPath.row == 5)
    {
        
    }else if (indexPath.row == 6)
    {
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0f;
}
#pragma mark 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"SetTableViewCell" bundle:nil] forCellReuseIdentifier:@"SetTableViewCellID"];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSArray arrayWithObjects:@"编辑个人资料",@"身份认证",@"交易设置",@"通知设置",@"问题反馈",@"联系官方",@"关于", nil];
    }
    return _itemsArray;
}


- (UIButton *)submitButton
{
    if (!_submitButton) {
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [_submitButton setBackgroundColor:[UIColor whiteColor]];
        [_submitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_submitButton.titleLabel setFont:kFontSize(16)];
    }
    return _submitButton;
}
@end

//
//  NewSetViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewSetViewController.h"
#import "NewSetTableViewCell.h"

// 更改密码
#import "ChangePasswordViewController.h"
// 忘记密码
#import "ForgetPassViewController.h"
// 更改手机号
#import "ChangeIphoneViewController.h"
// 意见反馈
#import "IdearViewController.h"
// 关于我们
#import "AboutUSViewController.h"
// 我的地址
#import "AddressViewController.h"


@interface NewSetViewController ()

@end

@implementation NewSetViewController

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
        UIView *lineView1 = [[UIView alloc]init];
        [self.view addSubview:lineView1];
        [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(KTopViewHeight);
            make.height.mas_equalTo(.3);
        }];
        lineView1.backgroundColor = [UIColor lightGrayColor];
}


- (IBAction)buttonAction:(UIButton *)sender
{
    NSLog(@"sender.tag  =%ld",sender.tag);
    
    if (sender.tag == 101)
    {
        NSLog(@"101");
        AddressViewController *vc = [[AddressViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (sender.tag == 102)
    {
        ChangePasswordViewController *vc = [[ChangePasswordViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (sender.tag == 103)
    {
        ForgetPassViewController *vc = [[ForgetPassViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (sender.tag == 104)
    {
        ChangePasswordViewController *vc = [[ChangePasswordViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (sender.tag == 105)
    {
          IdearViewController *vc = [[IdearViewController alloc]init];
          [self.navigationController pushViewController:vc animated:YES];
    }else if (sender.tag == 106)
    {
        NSLog(@"服务协议");
    }else if (sender.tag == 107)
    {
        AboutUSViewController *vc = [[AboutUSViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)loginOutButtonAction:(UIButton *)sender
{
   
    NSLog(@"退出登录");
}

//- (void)makeNav
//{
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"设置";
//    label.textColor = [UIColor blackColor];
//    self.navigationItem.titleView = label;
//
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
//    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
//    self.navigationItem.leftBarButtonItem = leftItem;
//}

//- (void)pushViewController
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (void)makeUI
//{
//    [self.view addSubview:self.mainView];
//    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.top.mas_equalTo(KTopViewHeight);
//        make.height.mas_equalTo(50 *6 + 5+1+10);
//    }];
//    [self.mainView reloadData];
//
//    UIButton *loginOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:loginOutButton];
//    [loginOutButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.top.equalTo(self.mainView.mas_bottom);
//        make.height.mas_equalTo(50);
//    }];
//    [loginOutButton setTitle:@"退出登录" forState:UIControlStateNormal];
//    [loginOutButton setTitleColor:kPickColor forState:UIControlStateNormal];
//    loginOutButton.titleLabel.font = [UIFont systemFontOfSize:16];
//
//    UIView *view0 = [[UIView alloc]init];
//    [self.view addSubview:view0];
//    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(0);
//        make.top.equalTo(loginOutButton.mas_bottom);
//    }];
//    view0.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//{
//    if (section == 0) {
//        return 4;
//    }else if (section == 1){
//        return 3;
//    }
//    return 2;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
//{
//    return 2;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    static NSString *cellID = @"NewSetTableViewCellID";
//    NewSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    NSArray *array = self.itemsArray[indexPath.section];
//    NSArray *titleArray = [array firstObject];
//    cell.iconLabel.text = titleArray[indexPath.row];
//
//    NSArray *imageArray = [array lastObject];
//    cell.iconImageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
//
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
//{
//
//    return 1;
//}
//
//- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 5;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 50;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 0) {
//        //  更改密码
//        if (indexPath.row == 0) {
//            ChangePasswordViewController *vc = [[ChangePasswordViewController alloc]init];
//
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//        //  忘记密码
//        if (indexPath.row == 1) {
//            ForgetPassViewController *vc = [[ForgetPassViewController alloc]init];
//
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//        //  更改手机号
//        if (indexPath.row == 2) {
//            ChangeIphoneViewController *vc = [[ChangeIphoneViewController alloc]init];
//
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//    }
//
//    if (indexPath.section == 1) {
//        //  意见反馈
//        if (indexPath.row == 0) {
//            IdearViewController *vc = [[IdearViewController alloc]init];
//
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//        //  服务协议
//        if (indexPath.row == 1) {
//
//        }
//        //  关于我们
//        if (indexPath.row == 2) {
//            AboutUSViewController *vc = [[AboutUSViewController alloc]init];
//
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//    }
//}


//#pragma mark lazyload
//- (UITableView *)mainView
//{
//    if (!_mainView) {
//        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//        [_mainView registerNib:[UINib nibWithNibName:@"NewSetTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewSetTableViewCellID"];
//        _mainView.estimatedSectionHeaderHeight = 0;
//        _mainView.estimatedSectionFooterHeight = 0;
//        _mainView.delegate = self;
//        _mainView.dataSource = self;
//        _mainView.scrollEnabled = NO;
//    }
//    return _mainView;
//}
//
//- (NSArray *)itemsArray
//{
//    if (!_itemsArray) {
//        NSArray *array1 = [NSArray arrayWithObjects:@"我的收获地址",@"更改密码",@"忘记密码",@"更换手机号", nil];
//        NSArray *array2 = [NSArray arrayWithObjects:@"意见反馈",@"服务协议",@"关于我们", nil];
//        NSArray *array3 = [NSArray arrayWithObjects:@"set_address_icon",@"password_icon",@"forget_icon",@"change_icon", nil];
//        NSArray *array4 = [NSArray arrayWithObjects:@"opinion_icon",@"fw_icon",@"as_icon", nil];
//
//        _itemsArray = [NSArray arrayWithObjects:@[array1,array3],@[array2,array4], nil];
//    }
//    return _itemsArray;
//}

@end

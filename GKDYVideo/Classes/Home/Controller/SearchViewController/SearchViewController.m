//
//  SearchViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"
#import "SearchMainViewController.h"
#import "SearchHistoryTableViewCell.h"
@interface SearchViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)UIView *navView;
@property (strong, nonatomic)SearchView *searchView;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     [self creatNav];
    
}

- (void)viewWillAppear:(BOOL)animated
{
   
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
     [self creatUI];
}

- (void)creatNav
{
    self.navView = [[UIView alloc]init];
    [self.view addSubview:self.navView];
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KStatusBarHeight+3);
        make.height.mas_equalTo(64);
    }];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navView addSubview:backButton];
   [backButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    backButton.frame = CGRectMake(0, 25, 40, 40);
    [backButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navView addSubview:self.searchView];
   
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.navView.mas_centerX);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(260, 34));
    }];
}

- (void)creatUI
{
    [self.view addSubview:self.tableView];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSArray *array = [user objectForKey:@"com.manfan.history"];
    NSLog(@"array.11coun34t  =%ld",array.count);
    NSLog(@"array  =%@",array);
    // 判断是否是第一次进入 没有 history
//    NSDictionary *firstStr = (NSDictionary *)[array firstObject];
//    NSArray *value = [firstStr allValues];
//    NSString *string = [value firstObject];
//    NSLog(@"string3 3 =%@",string);
    if (array.count == 0) {
        self.itemsArray = nil;
        self.tableView.frame = CGRectZero;
    }else{
        NSLog(@"不是空置");
        self.itemsArray = array;
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.equalTo(self.navView.mas_bottom).offset(0);
            make.height.mas_equalTo((self.itemsArray.count + 2) *40);
        }];
    }
    
    [self.tableView reloadData];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    NSString *value = textField.text;
    NSString *key = [self getCurrentTimes];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:value forKey:key];
    
    NSMutableArray * muArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"com.manfan.history"]];
    
    [muArray addObject:dic];
    
    [[NSUserDefaults standardUserDefaults] setObject:muArray forKey:@"com.manfan.history"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    SearchMainViewController *mainVC = [[SearchMainViewController alloc]init];
    mainVC.searchContentString = self.searchView.searchTextField.text;
    [self.navigationController pushViewController:mainVC animated:YES];
    
    return YES;
}

-(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYYMMddHHmmss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];

    return currentTimeString;
    
}

- (void)buttonAction
{
    NSLog(@"点击");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clearSearchHistoryButtonAction
{
     NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef removeObjectForKey:@"com.manfan.history"];
    
//     NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
//     NSArray *array = [userDef objectForKey:@"com.manfan.history"];
//     NSDictionary *firstStr = [array firstObject];
//     NSArray *value = [firstStr allValues];
//     NSString *string = [value firstObject];
//     if ([string isKindOfClass:[NSNull class]]) {
//     NSDictionary *dic = @{@"key":@""};
//     NSArray *array = [NSArray arrayWithObject:dic];
//     [userDef setObject:array forKey:@"com.manfan.history"];
//     }
//     [[NSUserDefaults standardUserDefaults] synchronize];
//------------------------------------------------------------------
//    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"com.manfan.history"];
//    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
//    NSDictionary *dic = @{@"key":@""};
//    NSArray *array = [NSArray arrayWithObject:dic];
//    [userDef setObject:array forKey:@"com.manfan.history"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//
//
    self.itemsArray = nil;
    self.tableView.frame = CGRectZero;
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"SearchHistoryTableViewCellID";
    SearchHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.itemsArray.count >0)
    {
        NSDictionary *dic = self.itemsArray[indexPath.row];
        NSArray *valueArray = [dic allValues];
        cell.historyLabel.text = [NSString stringWithFormat:@"%@",[valueArray firstObject]];
        cell.backgroundColor = [UIColor redColor];
    }
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.itemsArray[indexPath.row];
    NSArray *valueArray = [dic allValues];
    self.searchView.searchTextField.text = [valueArray firstObject] ;
    SearchMainViewController *mainVC = [[SearchMainViewController alloc]init];
    [self.navigationController pushViewController:mainVC animated:YES];
}

#pragma mark 懒加载
- (NSArray *)itemsArray
{
    if (!_itemsArray)
    {
        _itemsArray = kUser.history;
    }
    return _itemsArray;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
       // _tableView.scrollEnabled = NO;
         _tableView.backgroundColor  = kMainColor
        [_tableView registerClass:[SearchHistoryTableViewCell class] forCellReuseIdentifier:@"SearchHistoryTableViewCellID"];
        UIButton *clearSearchHistoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        clearSearchHistoryButton.frame = CGRectMake(0, 0, kWindowWidth, 40);
        [clearSearchHistoryButton setTitle:@"清除所有搜索记录" forState:UIControlStateNormal];
        [clearSearchHistoryButton addTarget:self action:@selector(clearSearchHistoryButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _tableView.tableFooterView = clearSearchHistoryButton;
    }
    return _tableView;
}

- (SearchView *)searchView
{
    if (!_searchView)
    {
        _searchView = [[SearchView alloc]init];
        _searchView.searchTextField.delegate = self;
        _searchView.searchTextField.keyboardType = UIKeyboardTypeWebSearch;
    }
    return _searchView;
}

@end

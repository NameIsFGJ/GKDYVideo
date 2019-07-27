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
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self creatNav];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self creatUI];
    
}
- (void)creatNav
{
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 64)];
    [self.view addSubview:self.navView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navView addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 25, 40, 40);
    [backButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
   
    SearchView *searchView = [[SearchView alloc]init];
    searchView.frame = CGRectMake(40, 25, 260, 34);
    searchView.searchTextField.delegate = self;
    searchView.searchTextField.keyboardType = UIKeyboardTypeWebSearch;
    [self.navView addSubview:searchView];
}

- (void)creatUI
{
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWindowWidth, self.itemsArray.count * 40);
    NSLog(@"self.itemsArray.count  =%ld",self.itemsArray.count);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    NSString *value = textField.text;
    NSString *key = [self getCurrentTimes];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:value forKey:key];
    NSMutableArray *muArray = [NSMutableArray arrayWithArray:kUser.history];
    [muArray addObject:dic];
    self.itemsArray = muArray;
    [self.tableView reloadData];
    [[NSUserDefaults standardUserDefaults] setObject:muArray forKey:@"khistory"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    SearchMainViewController *mainVC = [[SearchMainViewController alloc]init];
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
    NSDictionary *dic = self.itemsArray[indexPath.row];
    NSArray *valueArray = [dic allValues];
    cell.historyLabel.text = [valueArray firstObject] ;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

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
         _tableView.backgroundColor  = [UIColor colorWithHex:@"#222934"];
        [_tableView registerClass:[SearchHistoryTableViewCell class] forCellReuseIdentifier:@"SearchHistoryTableViewCellID"];
    }
    return _tableView;
}

@end

//
//  MarketSearchViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/20.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketSearchViewController.h"
#import "SearchView.h"
#import "WSLWaterFlowLayout.h"
#import "MarketSearchCollectionViewCell.h"
#import "MarketSearchGoodsMainController.h"
@interface MarketSearchViewController ()<UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate>
@property (strong, nonatomic)UIView *navView;
@property (strong, nonatomic)SearchView *searchView;
@property (strong, nonatomic)UICollectionView *mainView;
@property (strong, nonatomic)WSLWaterFlowLayout *flowLayout;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@end

@implementation MarketSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     [self.navigationController setNavigationBarHidden:YES animated:YES];
    
     self.view.backgroundColor = [UIColor whiteColor];
     [self creatNav];
     [self makeUI];
}

#pragma mark Action
- (void)creatNav
{
    self.navView = [[UIView alloc]init];
    [self.view addSubview:self.navView];
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(KTopViewHeight);
    }];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navView addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
 
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(25);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [backButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navView addSubview:self.searchView];
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.top.mas_equalTo(25);
        make.size.mas_equalTo(CGSizeMake(260, 34));
    }];
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];

    UILabel *label0 = [[UILabel alloc]init];//WithFrame:CGRectMake(10, 0, 80, 30)];
    [view0 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
   
    label0.text = @"最近搜索";
    label0.font = kFontSize(14);
    label0.textColor = [UIColor blackColor];
    
    UIImageView *deleteImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"deleleImage2"]];
    [view0 addSubview:deleteImageView];
    [deleteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(14, 16));
    }];
    
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view0.mas_bottom).offset(10);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(300);
    }];
}
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    NSString *value = textField.text;
    NSString *key = [self getCurrentTimes];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:value forKey:key];
    NSMutableArray *muArray = [NSMutableArray arrayWithArray:kUser.goodsHistory];
    [muArray addObject:dic];
    [self.itemsArray addObjectsFromArray:muArray];
    
    [self.mainView reloadData];
    [[NSUserDefaults standardUserDefaults] setObject:muArray forKey:@"kGoodsHistory"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    self.searchStr = value;
    MarketSearchGoodsMainController *vc = [[MarketSearchGoodsMainController alloc]init];
    NSLog(@"value  =%@",value);
    vc.searchStr = self.searchStr;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
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
#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MarketSearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MarketSearchCollectionViewCellID" forIndexPath:indexPath];
    cell.searchLabel.text = self.itemsArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.searchStr = self.itemsArray[indexPath.row];
    NSLog(@"self.itemsArray[indexPath.row]  =%@",self.itemsArray[indexPath.row]);
    MarketSearchGoodsMainController *vc = [[MarketSearchGoodsMainController alloc]init];
    vc.searchStr = self.searchStr;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark WSLWaterCollectionViewDelegate
- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *string = self.itemsArray[indexPath.row];
    CGSize fontSize = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}];
    return CGSizeMake(fontSize.width + 30, 30);
}
/** 头视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForHeaderViewInSection:(NSInteger)section{
     return CGSizeMake(0, 0);
}
/** 脚视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForFooterViewInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}

/** 列间距*/
-(CGFloat)columnMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;{
    return 10;
}

/** 行间距*/
-(CGFloat)rowMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 10;
}

/** 边缘之间的间距*/
-(UIEdgeInsets)edgeInsetInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
#pragma mark 懒加载
- (SearchView *)searchView
{
    if (!_searchView) {
        _searchView = [[SearchView alloc]init];
        _searchView.backgroundColor = [UIColor whiteColor];
        _searchView.layer.borderWidth = .6;
        _searchView.layer.borderColor = [UIColor blackColor].CGColor;
        _searchView.lineView.backgroundColor = [UIColor lightGrayColor];
        _searchView.searchImageView.image = [UIImage imageNamed:@"searchGrayImage"];
        [_searchView.cleanSearchButton setImage:[UIImage imageNamed:@"deleteGrayImage"] forState:UIControlStateNormal];
        _searchView.searchTextField.text = @"adfafasdf";
        _searchView.searchTextField.delegate = self;
        _searchView.searchTextField.keyboardType = UIKeyboardTypeWebSearch;
    }
    return _searchView;
}

- (UICollectionView *)mainView
{
    if (!_mainView) {
        
        _mainView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _mainView.backgroundColor = [UIColor whiteColor];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        [_mainView registerNib:[UINib nibWithNibName:@"MarketSearchCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MarketSearchCollectionViewCellID"];
    }
    return _mainView;
}

- (WSLWaterFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[WSLWaterFlowLayout alloc]init];
        _flowLayout.delegate = self;
        _flowLayout.flowLayoutStyle = WSLWaterFlowVerticalEqualHeight;
    }
    return _flowLayout;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray arrayWithObjects:@"色哦的色哦色哦的色哦的色的色哦的色哦的色哦的色哦的",@"色哦的色",@"行",@"多个",@"色",@"色哦的色",@"色哦的色",@"色哦的色", nil];
    }
    return _itemsArray;
}
@end

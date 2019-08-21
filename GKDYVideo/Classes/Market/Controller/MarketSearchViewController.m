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
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 64)];
    [self.view addSubview:self.navView];

    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navView addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 25, 40, 40);
    
    [backButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navView addSubview:self.searchView];
    self.searchView.frame = CGRectMake(60, 25, 260, 34);
    
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    UIView *view0 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWindowWidth, 30)];
    [self.view addSubview:view0];
    UILabel *label0 = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 30)];
    [view0 addSubview:label0];
    label0.text = @"最近搜索";
    label0.font = kFontSize(14);
    label0.textColor = [UIColor blackColor];
    
    UIImageView *deleteImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"deleleImage2"]];
    [view0 addSubview:deleteImageView];
    deleteImageView.frame = CGRectMake(kWindowWidth - 30, 0, 14, 16);
    
    [self.view addSubview:self.mainView];
    self.mainView.frame = CGRectMake(0, CGRectGetMaxY(view0.frame), kWindowWidth, 200);
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
    NSLog(@"self.itemsArray  =%@",self.itemsArray[indexPath.row]);
}

#pragma mark WSLWaterCollectionViewDelegate
- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *string = self.itemsArray[indexPath.row];
    NSLog(@"string  =%@",string);
    CGSize fontSize = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}];
    NSLog(@"fontSize.heig34ht  =%f",fontSize.height);
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
//
///** 列数*/
//-(CGFloat)columnCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
//    return 3;
//}
///** 行数*/
//-(CGFloat)rowCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
//
//    return 5;
//   // return ceil(self.itemsArray.count /3);
//}

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

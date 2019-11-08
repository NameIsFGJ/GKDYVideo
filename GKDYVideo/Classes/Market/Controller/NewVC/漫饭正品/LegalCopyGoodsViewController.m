//
//  LegalCopyGoodsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "LegalCopyGoodsViewController.h"
#import "RankListCollectionViewCell.h"
#import "RankListCollectionReusableView.h"
#import "NewMarketShopCartViewController.h"
#import "PickSearchBar.h"

@interface LegalCopyGoodsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate>

@property (strong, nonatomic) UICollectionView *mainView;
@property (strong, nonatomic) PickSearchBar *searchBar;

@end

@implementation LegalCopyGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.delegate = self;
    
    [self makeUI];
    
    
}

- (void)makeUI
{
    
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.top.mas_equalTo(0);
                    make.height.mas_equalTo(KTopViewHeight);
                }];
     view0.backgroundColor = kPickColor;
    UIButton * popButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:popButton];
    
    [popButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.bottom.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [popButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    [popButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [view0 addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view0.mas_centerX);
        make.bottom.equalTo(popButton.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(240, 45));
    }];
    
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)buttonAction
{
    NSLog(@"阿萨德发生的");
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
    BOOL isShowBar = [viewController isKindOfClass:[self class]];
  //  NSLog(@"%@",isShowBar ? @"1":@"0");
    
    [self.navigationController setNavigationBarHidden:isShowBar animated:YES];
}

#pragma mark UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 8;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"RankListCollectionViewCellID";
    RankListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(kWindowWidth/2-15, 215);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
{
    return CGSizeMake(kWindowWidth, 85);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
{
    RankListCollectionReusableView *headView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        RankListCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RankListCollectionReusableViewID" forIndexPath:indexPath];
        headView = view;
    }
    return headView;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    NewMarketShopCartViewController *vc = [[NewMarketShopCartViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark loazLoad
- (UICollectionView *)mainView
{
    if (!_mainView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _mainView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        _mainView.backgroundColor = kBgColor;
        [_mainView registerNib:[UINib nibWithNibName:@"RankListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RankListCollectionViewCellID"];
        [_mainView registerNib:[UINib nibWithNibName:@"RankListCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RankListCollectionReusableViewID"];
        
    }
    return _mainView;
}

//- (void)
- (PickSearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[PickSearchBar alloc]init];
        //_searchBar.backgroundColor = kWhiteColor;
       // _searchBa = kWhiteColor;
    }
    return _searchBar;
}
@end

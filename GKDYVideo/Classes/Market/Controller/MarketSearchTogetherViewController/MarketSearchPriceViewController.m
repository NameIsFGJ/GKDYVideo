//
//  MarketSearchPriceViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketSearchPriceViewController.h"
#import "WSLWaterFlowLayout.h"
#import "MarketCollectionViewCell.h"
#import "MarketModel.h"
#import "MarketSearchGoodsNetworking.h"
@interface MarketSearchPriceViewController()<UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate>
@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)WSLWaterFlowLayout *flowLayout;

@end

@implementation MarketSearchPriceViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeUI];
    [self networking];
    
}

- (void)networking
{
    
    [MarketSearchGoodsNetworking postSearchGoodsWithKeyword:self.searchStr withPage:1 withSale:1 withPrice:2 complection:^(MarketUserShopModel * _Nonnull model, NSError * _Nonnull error) {
        self.itemsArray = model.rows;
        [self.collectionView reloadData];
    }];
}

- (void)makeUI
{
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MarketCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MarketCollectionViewCellID" forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor colorWithHex:@"#FFE3EE"];
    }else{
        cell.backgroundColor = [UIColor colorWithHex:@"#DAE1FF"];
    }
    cell.searchModel = self.itemsArray[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"indexPath.row  =%ld",indexPath.row);
}


#pragma mark WSLWaterFlowLayoutDelegate
- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    RowsModel *model = self.itemsArray[indexPath.row];
    if (model.imageheight == 606) {
        return CGSizeMake(0, 250);
    }
    return CGSizeMake(0, model.imageheight);
    // return CGSizeMake(0, 0);
}
/** 头视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForHeaderViewInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}
/** 脚视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForFooterViewInSection:(NSInteger)section;
{
    return CGSizeMake(0, 0);
}



/** 列数*/
-(CGFloat)columnCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
{
    return 2;
    
}
/** 行数*/
-(CGFloat)rowCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
{
    return self.itemsArray.count/2;
}
/** 列间距*/
-(CGFloat)columnMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
{
    return 10;
}
/** 行间距*/
-(CGFloat)rowMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
{
    return 10;
}
/** 边缘之间的间距*/
-(UIEdgeInsets)edgeInsetInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
#pragma makr 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        self.flowLayout = [[WSLWaterFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        self.flowLayout.delegate = self;
        self.flowLayout.flowLayoutStyle = WSLWaterFlowVerticalEqualWidth;
        
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"MarketCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MarketCollectionViewCellID"];
    }
    return _collectionView;
}

- (NSArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSArray array];
    }
    return _itemsArray;
}

@end

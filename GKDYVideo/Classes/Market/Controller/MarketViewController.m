//
//  MarketViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketViewController.h"
#import "MarkCollectionHeadView.h"
#import "MarkCollectionHead2View.h"
#import "MarkCollectionFootView.h"
#import "MarketNetworking.h"
#import "MarketCollectionViewCell.h"
#import "MarketModel.h"
#import "WSLWaterFlowLayout.h"
#import "MarketShopDetailViewController.h"

@interface MarketViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate>
@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)MarkCollectionHeadView *headView;
@property (strong, nonatomic)MarkCollectionHead2View *head2View;
@property (strong, nonatomic)MarketModel *model;
@property (strong, nonatomic)NSArray *tempArray;
@property (strong, nonatomic)WSLWaterFlowLayout *flowLayout;
@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
   
     [self makeUI];
     [self networking];
    
    HotGoodsModel *model0 = [[HotGoodsModel alloc]init];
    model0.cover = @"/uploads/20190731/e4f9aef2431f100b260aab30cfd59849.png";
    model0.ide = 0;
    model0.imageheight = 250;
    model0.imagewidth = 606;
    model0.name = @"裤子";
    model0.price = @"33.11" ;
    
    HotGoodsModel *model1 = [[HotGoodsModel alloc]init];
    model1.cover = @"/uploads/20190731/e4f9aef2431f100b260aab30cfd59849.png";
    model1.ide = 1;
    model1.imageheight = 190;
    model1.imagewidth = 806;
    model1.name = @"袜子";
    model1.price = @"999.90" ;
    
    HotGoodsModel *model2 = [[HotGoodsModel alloc]init];
    model2.cover = @"/uploads/20190731/e4f9aef2431f100b260aab30cfd59849.png";
    model2.ide = 2;
    model2.imageheight = 250;
    model2.imagewidth = 606;
    model2.name = @"绳阿斯顿飞子";
    model2.price = @"2321.222" ;
    
    HotGoodsModel *model3 = [[HotGoodsModel alloc]init];
    model3.cover = @"/uploads/20190731/e4f9aef2431f100b260aab30cfd59849.png";
    model3.ide = 3;
    model3.imageheight = 190;
    model3.imagewidth = 606;
    model3.name = @"是淡粉色";
    model3.price = @"9091.23" ;
    
    self.tempArray = [NSArray arrayWithObjects:model0,model1,model2,model3, nil];

    
   
}

- (void)makeUI
{
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(-KStatusBarHeight);
    }];
}

- (void)networking
{
        [MarketNetworking postIndexWithCompletion:^(MarketModel * _Nonnull model, NSError * _Nonnull error) {
            
            self.model = model;
            self.itemsArray = [NSArray arrayWithObjects:model.hot_goods,model.hot_rent, nil];
            [self.collectionView reloadData];
        }];
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    if (section == 0) {
        NSArray *array0 = self.itemsArray[0];
        NSLog(@"array0.count  =%ld",array0.count);
    //   return array0.count;
       // return 4;
        return self.tempArray.count;
    }
    if (section == 1) {
        NSArray *array1 = self.itemsArray[1];
        NSLog(@"array1.count  =%ld",array1.count);
       // return array1.count;
    return 4;
    }
    return 11;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
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
    cell.model = self.tempArray[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   MarketShopDetailViewController *vc = [[MarketShopDetailViewController alloc]init];
    vc.ide = 1;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        if (indexPath.section ==0)
        {
            self.headView = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MarkCollectionHeadViewID" forIndexPath:indexPath];
            self.headView.getBlock(self.model);
            
            reusableView = self.headView;
        }
        if (indexPath.section == 1)
        {
            self.head2View = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MarkCollectionHead2ViewID" forIndexPath:indexPath];
             reusableView = self.head2View;
        }
    }
    
    if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        MarkCollectionFootView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MarkCollectionFootViewID" forIndexPath:indexPath];
        reusableView = view;
    }
    return reusableView;
}

#pragma mark WSLWaterFlowLayoutDelegate
- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    HotGoodsModel *model = self.tempArray[indexPath.row];
    
    return CGSizeMake(0, model.imageheight);
}

/** 头视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForHeaderViewInSection:(NSInteger)section;
{
            if (section == 0)
            {
                 return CGSizeMake(kWindowWidth, 440);
            }else if (section == 1)
            {
                 return CGSizeMake(kWindowWidth, 80);
            }
                 return CGSizeMake(0, 0);
}
/** 脚视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForFooterViewInSection:(NSInteger)section;
{
     return CGSizeMake(kWindowWidth, 50);
}

/** 列数*/
-(CGFloat)columnCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
{
    return 2;
    
}
/** 行数*/
-(CGFloat)rowCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
{
    return self.tempArray.count/2;
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
        
         [_collectionView registerClass:[MarkCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MarkCollectionHeadViewID"];
        
        [_collectionView registerClass:[MarkCollectionHead2View class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MarkCollectionHead2ViewID"];
    
        [_collectionView registerClass:[MarkCollectionFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MarkCollectionFootViewID"];
    }
    return _collectionView;
}

@end

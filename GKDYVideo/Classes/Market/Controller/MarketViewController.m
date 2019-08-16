//
//  MarketViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketViewController.h"
#import "MarkCollectionHeadView.h"
#import "MarketNetworking.h"
#import "MarketCollectionFooterView.h"
static NSInteger currentRow;

@interface MarketViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (strong, nonatomic)NSMutableArray *categoryArray;

@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    [self makeUI];
    [self networking];
    
   
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
        NSLog(@"ad_list  =%ld",model.ad_list.count);
        
//        for (NSDictionary *dic in model.category) {
//            CategoryModel *model = [CategoryModel yy_modelWithDictionary:dic];
//            [self.categoryArray addObject:model];
//        }
        
       // NSLog(@"self.categoryArray.count  =%ld",self.categoryArray.count);
    }];
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 6;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    return 2;
}

// 返回cell 的尺度大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    currentRow += indexPath.row;
    if (currentRow %2 == 0) {
        return CGSizeMake((kWindowWidth -30)/2, 220);
    }else
    {
        return CGSizeMake((kWindowWidth -30)/2, 250);
    }
}

// 行 间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

// 列 间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

// cell 缩进
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
{
    if (section == 0) {
         return CGSizeMake(kWindowWidth, 400);
    }
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
{
    if (section == 0) {
        return CGSizeMake(kWindowWidth, 55);
    }
    return CGSizeMake(0, 0);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
       UICollectionReusableView *reusableView = nil;
    if (indexPath.section == 0)
    {
        if ([kind isEqual:UICollectionElementKindSectionHeader])
        {
            [collectionView registerClass:[MarkCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MarkCollectionHeadViewID"];
            
            MarkCollectionHeadView *headView = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MarkCollectionHeadViewID" forIndexPath:indexPath];
            reusableView = headView;
        }
        if ([kind isEqual:UICollectionElementKindSectionFooter]) {
            [collectionView registerNib:[UINib nibWithNibName:@"MarketCollectionFooterView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MarketCollectionFooterViewID"];
            
            MarketCollectionFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MarketCollectionFooterViewID" forIndexPath:indexPath];
            reusableView = footerView;
            
            
        }
        return reusableView;
    }
    return nil;
   
}

#pragma mark UICollectionViewDelegate

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCellID"];
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSMutableArray *)categoryArray
{
    if (!_categoryArray) {
        _categoryArray = [NSMutableArray array];
    }
    return _categoryArray;
}
@end

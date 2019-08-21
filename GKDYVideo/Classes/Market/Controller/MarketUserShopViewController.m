//
//  MarketUserShopViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketUserShopViewController.h"
#import "MarketUserShopCollectionViewCell.h"
#import "MarkUserShopCollectionHeadView.h"
#import "MarketUserShopNetworking.h"
#import "MarketUserShopModel.h"
@interface MarketUserShopViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic)UICollectionView *mainView;
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)MarkUserShopCollectionHeadView *headView;
@property (assign, nonatomic)NSInteger total;
@end

@implementation MarketUserShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeUI];
    
    [self networking];
}

- (void)makeUI
{
    [self.view addSubview:self.mainView];
    self.mainView.frame = self.view.bounds;
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(-KStatusBarHeight);
    }];
}

- (void)networking
{
    [MarketUserShopNetworking postUserShopWithUsrID:self.userID withPage:1 completion:^(MarketUserShopModel * _Nonnull model, NSError * _Nonnull error) {
       // NSLog(@"model.total  =%ld",model.total);
        self.total = model.total;
        self.itemsArray = model.rows;
        
        [self.mainView reloadData];
    }];
}

#pragma mark Action
- (void)popViewcontroller
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"MarketUserShopCollectionViewCellID";
    MarketUserShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.itemsArray[indexPath.row];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        self.headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MarkUserShopCollectionHeadViewID" forIndexPath:indexPath];
        [self.headView.popButton addTarget:self action:@selector(popViewcontroller) forControlEvents:UIControlEventTouchUpInside];
        // 头像
        NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,self.head_url];
        [self.headView.headImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        // 昵称
        self.headView.nameLabel.text = self.nickName;
        self.headView.getBlock(self.total);
        view = self.headView;
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(170, 280);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
{
    return CGSizeMake(kWindowWidth, 170);
}

#pragma mark 懒加载
- (UICollectionView *)mainView
{
    if (!_mainView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _mainView.backgroundColor = [UIColor whiteColor];
        
        [_mainView registerNib:[UINib nibWithNibName:@"MarketUserShopCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MarketUserShopCollectionViewCellID"];

        [_mainView registerClass:[MarkUserShopCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MarkUserShopCollectionHeadViewID"];
        
        _mainView.delegate = self;
        _mainView.dataSource = self;
    }
    return _mainView;
}

- (NSArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSArray array];
    }
    return _itemsArray;
}

@end

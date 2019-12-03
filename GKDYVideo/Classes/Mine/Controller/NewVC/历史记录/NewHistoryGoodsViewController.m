//
//  NewHistoryGoodsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewHistoryGoodsViewController.h"
#import "NewLikeCollectionViewCell.h"
@interface NewHistoryGoodsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic)UICollectionView *collectionView;

@end

@implementation NewHistoryGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kBgColor;
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    //self.collectionView.frame = self.view.bounds;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
   // self.collectionView.frame = self.view.bounds;
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 8;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"NewLikeCollectionViewCellID";
    NewLikeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath = %ld",indexPath.row);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(170*kWindowWidth/375, 265*kWindowWidth/375);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}


#pragma mark lazyLoad
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:@"NewLikeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"NewLikeCollectionViewCellID"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        //_collectionView.backgroundColor = [UIColor whiteColor];
        //_collectionView.scrollEnabled = NO;
       // _collectionView.scrollEnabled = NO;
        
    }
    return _collectionView;
}


@end

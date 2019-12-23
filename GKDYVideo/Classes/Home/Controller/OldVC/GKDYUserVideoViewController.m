//
//  GKDYUserVideoViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDYUserVideoViewController.h"
#import "VideoCollectionViewCell.h"
#import "IndexModel.h"
#import "GKDYPlayerViewController.h"
#import "SearchVideoModel.h"
@interface GKDYUserVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation GKDYUserVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeUI];
    
}

- (void)makeUI
{
    self.navigationController.navigationBarHidden = NO;
    
    if (self.vcType == 1) {
        NSLog(@"我的作品");
    }else if (self.vcType == 2){
        NSLog(@"我喜欢的");
    }
    
    [self.view addSubview:self.mainView];
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
    //return 7;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;{
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"VideoCollectionViewCellID";
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.itemsArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *itemsArray = [NSMutableArray array];
    for (int i = 0; i< self.itemsArray.count; i++) {
        
        SearchVideoModel *model = self.itemsArray[i];
        IndexModel *indexModel = [[IndexModel alloc]init];
        indexModel.identify = i;
        indexModel.video_url = model.video_url;
        [itemsArray addObject:indexModel];
    }
    
    GKDYPlayerViewController *playerVC = [[GKDYPlayerViewController alloc]initWithVideos:itemsArray index:indexPath.item];
    [self.navigationController pushViewController:playerVC animated:YES];
}

// 返回cell 的尺度大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake((kWindowWidth-12-12-3-3)/3, 150);
}

// 行 间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 3;
}

// 列 间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 3;
}

- (NSArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSArray array];
    }
    return _itemsArray;
}

#pragma mark 懒加载
- (UICollectionView *)mainView
{
    if (!_mainView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _mainView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        _mainView.showsVerticalScrollIndicator = NO;
        _mainView.showsHorizontalScrollIndicator = NO;
        _mainView.backgroundColor = kMainColor;
        [_mainView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"VideoCollectionViewCellID"];
    }
    return _mainView;
}

@end

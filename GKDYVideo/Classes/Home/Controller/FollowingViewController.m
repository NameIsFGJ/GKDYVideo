//
//  FollowingViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "FollowingViewController.h"
#import "FollowingCollectionViewCell.h"
#import "VideoGuanNetworking.h"
#import "VideoGuanModel.h"
#import "IndexModel.h"
#import "GKDYPlayerViewController.h"
@interface FollowingViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)NSArray *itemsArray;
@end

@implementation FollowingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self makeUI];
    [self networking];
    
}

- (void)makeUI
{
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = self.view.bounds;
}
- (void)networking
{
    [VideoGuanNetworking postVideoGuanWithUserID:1 withPage:1 completion:^(NSArray * _Nonnull array, NSError * _Nonnull error) {
        self.itemsArray = array;
        [self.collectionView reloadData];
    }];
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    VideoGuanModel *model = self.itemsArray[section];
    return model.video.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"FollowingCollectionViewCellID";
    FollowingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    VideoGuanModel *model = self.itemsArray[indexPath.section];
    cell.model = model.video[indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    
    return self.itemsArray.count;
}

// 头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyCollectionViewHeaderView" forIndexPath:indexPath];
        headView.backgroundColor = kMainColor
        UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 36, 36)];
        //iconImageView.backgroundColor = [UIColor yellowColor];
        iconImageView.layer.cornerRadius = 18;
        iconImageView.layer.masksToBounds = YES;
        [headView addSubview:iconImageView];
        
        UILabel *userLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconImageView.frame)+10, 10, 200, 30)];
        [headView addSubview:userLabel];
        [userLabel setTextColor:kWhiteColor];
        [userLabel setFont:[UIFont systemFontOfSize:18]];
        //userLabel.text = @"漫饭一号";
        // 赋值
         VideoGuanModel *model = self.itemsArray[indexPath.section];
        NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,model.head_pic];
        [iconImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        
        userLabel.text = model.nickname;
        return headView;
    }
    return nil;
}

// 头视图frame
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
{
    return CGSizeMake(kWindowWidth, 55);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoGuanModel *model = self.itemsArray[indexPath.section];
    NSMutableArray *itemsArray = [NSMutableArray array];
    for (int i = 0; i< model.video.count; i++) {
        
        VideoModel *videoModel = model.video[i];
        IndexModel *indexModel = [[IndexModel alloc]init];
        indexModel.identify = i;
        indexModel.video_url = [videoModel valueForKey:@"video_url"];
        [itemsArray addObject:indexModel];
    }
    
    //    NSMutableArray *itemsArray = [NSMutableArray array];
    //    for (SearchVideoModel *videoModel in self.itemsArray) {
    //        IndexModel *indexModel = [[IndexModel alloc]init];
    //        indexModel.video_url = videoModel.video_url;
    //        indexModel.identify = 34;
    //
    //        [itemsArray addObject:indexModel];
    //    }
    GKDYPlayerViewController *playerVC = [[GKDYPlayerViewController alloc]initWithVideos:itemsArray index:indexPath.item];
    
    [self.navigationController pushViewController:playerVC animated:YES];
}


// 返回cell 的尺度大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake((kWindowWidth -30)/2, 250);
}

// 行 间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

// 列 间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

// cell 缩进
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
#pragma mark 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = kMainColor
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[FollowingCollectionViewCell class] forCellWithReuseIdentifier:@"FollowingCollectionViewCellID"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyCollectionViewHeaderView"];
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

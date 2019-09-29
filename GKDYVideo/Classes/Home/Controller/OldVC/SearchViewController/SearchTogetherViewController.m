//
//  SearchTogetherViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchTogetherViewController.h"
#import "VideoCollectionViewCell.h"
#import "SearchVideoModel.h"
#import "GKDYPlayerViewController.h"
@interface SearchTogetherViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)NSMutableArray *indexModelArray;

@end

@implementation SearchTogetherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSArray *userArray = [user objectForKey:@"com.manfan.history"];
    NSLog(@"userAr34ray.count  =%ld",userArray.count);
    
    
    
    UICollectionViewFlowLayout *layou = [[UICollectionViewFlowLayout alloc]init];
    layou.scrollDirection = UICollectionViewScrollDirectionVertical;
   self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, kWindowHeight- 64- 48- 40) collectionViewLayout:layou];
    [self.collectionView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"VideoCollectionViewCellID"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = kMainColor
    [self.view addSubview:self.collectionView];
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
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
  //  SearchVideoModel *model = self.itemsArray[indexPath.row];
   // NSLog(@"model.video_url  =%@",model.video_url);
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

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}


@end

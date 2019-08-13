//
//  MarketViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketViewController.h"
#import "MarketHeadView.h"

static NSInteger currentRow;

@interface MarketViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)NSMutableArray *itemsArray;


@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = self.view.bounds;
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
    NSLog(@"section  =%ld",section);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

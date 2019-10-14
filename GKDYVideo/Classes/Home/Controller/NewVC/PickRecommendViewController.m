//
//  PickRecommendViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "PickRecommendViewController.h"
#import "WSLWaterFlowLayout.h"
#import "PickCollectionViewCell.h"
#import "MarketModel.h"
@interface PickRecommendViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate>
@property (strong, nonatomic) UICollectionView *mainView;
@property (strong, nonatomic) WSLWaterFlowLayout *flowLayout;
@property (strong, nonatomic) NSArray *itemsArray;

@end

@implementation PickRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];
    
    HotGoodsModel *model0 = [[HotGoodsModel alloc]init];
        model0.cover = @"/uploads/20190731/e4f9aef2431f100b260aab30cfd59849.png";
        model0.ide = 0;
        model0.imageheight = @"260";
        model0.name = @"裤子";
        model0.price = @"33.11" ;
    
        HotGoodsModel *model1 = [[HotGoodsModel alloc]init];
        model1.cover = @"/uploads/20190731/e4f9aef2431f100b260aab30cfd59849.png";
        model1.ide = 1;
        model1.imageheight = @"300";
        model1.name = @"袜子";
        model1.price = @"999.90" ;
    
        HotGoodsModel *model2 = [[HotGoodsModel alloc]init];
        model2.cover = @"/uploads/20190731/e4f9aef2431f100b260aab30cfd59849.png";
        model2.ide = 2;
        model2.imageheight = @"300";
        model2.name = @"绳阿斯顿飞子";
        model2.price = @"2321.222" ;
    
        HotGoodsModel *model3 = [[HotGoodsModel alloc]init];
        model3.cover = @"/uploads/20190731/e4f9aef2431f100b260aab30cfd59849.png";
        model3.ide = 3;
        model3.imageheight = @"260";
        model3.name = @"是淡粉色";
        model3.price = @"9091.23" ;
    
    self.itemsArray = [NSArray arrayWithObjects:model0,model1,model2,model3,model0,model1,model2,model3, nil];
    
    [self.mainView reloadData];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
   
     self.mainView.frame = self.view.bounds;
}

#pragma mark UIColletionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"PickCollectionViewCellID";
    
    PickCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.itemsArray[indexPath.row];
    
    return cell;
}

#pragma mark WSLWaterFlowLayoutDelegate
- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    HotGoodsModel *model = self.itemsArray[indexPath.row];
    return CGSizeMake(0, [model.imageheight integerValue]);
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

#pragma mark EmptyDelegate
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"emptyImage"];
}
#pragma mark 懒加载
- (UICollectionView *)mainView
{
    if (!_mainView) {
        
        self.flowLayout = [[WSLWaterFlowLayout alloc]init];
        _mainView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        self.flowLayout.delegate = self;
        self.flowLayout.flowLayoutStyle = WSLWaterFlowVerticalEqualWidth;
        
        _mainView.delegate =self;
        _mainView.dataSource = self;
        _mainView.backgroundColor = [UIColor whiteColor];
        _mainView.emptyDataSetSource = self;
        _mainView.emptyDataSetDelegate = self;
        [_mainView registerNib:[UINib nibWithNibName:@"PickCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PickCollectionViewCellID"];
        
    }
    return _mainView;
}

@end

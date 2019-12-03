//
//  NewGiveViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewGiveViewController.h"
#import "WSLWaterFlowLayout.h"
#import "PickCollectionViewCell.h"
#import "MarketModel.h"

@interface NewGiveViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (strong, nonatomic) UICollectionView *mainView;
@property (strong, nonatomic) WSLWaterFlowLayout *flowLayout;
@property (strong, nonatomic) NSArray *itemsArray;


@end

@implementation NewGiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kWhiteColor;
    
    [self makeNav];
    [self makeUI];
    
}

- (void)makeNav
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"我的打赏";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
    }];
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // PickRecommendDetailViewController *vc = [[PickRecommendDetailViewController alloc]init];
    // [self.navigationController pushViewController:vc animated:YES];
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
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark EmptyDelegate
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"emptyImage"];
}
- (BOOL)setupTarbarHidden
{
    return NO;
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
        _mainView.backgroundColor = kBgColor;
        _mainView.emptyDataSetSource = self;
        _mainView.emptyDataSetDelegate = self;
        [_mainView registerNib:[UINib nibWithNibName:@"PickCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PickCollectionViewCellID"];
        
    }
    return _mainView;
}

@end

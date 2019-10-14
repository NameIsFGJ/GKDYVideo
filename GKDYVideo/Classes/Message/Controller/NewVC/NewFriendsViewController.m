//
//  NewFriendsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewFriendsViewController.h"
#import "UUMarqueeView.h"
#import "WSLWaterFlowLayout.h"
#import "PickCollectionViewCell.h"
#import "MarketModel.h"
#import "InterestMainViewController.h"
#import "AuthenMainViewController.h"
@interface NewFriendsViewController ()<UUMarqueeViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate>
@property (strong, nonatomic)UUMarqueeView *marquee;

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) WSLWaterFlowLayout *flowLayout;
@property (strong, nonatomic) NSArray *itemsArray;
@end

@implementation NewFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"饭圈";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *mainView = [[UIScrollView alloc]init];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    
    UIView *contentView = [[UIView alloc]init];
    [mainView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(mainView);
        make.width.equalTo(mainView);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    [contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(contentView.mas_top);
        make.height.mas_equalTo(1);
    }];
    lineView.backgroundColor = [UIColor colorWithHex:@"#F5F8FA"];
    UIView *view0 = [[UIView alloc]init];
    [contentView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(lineView.mas_bottom);
    }];
    
    [view0 addSubview:self.marquee];
    [self.marquee mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.mas_equalTo(0);
    }];

    [self.marquee reloadData];
    
    UIView *lineView2 = [[UIView alloc]init];
    [contentView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom);
        make.height.mas_equalTo(11);
    }];
    lineView2.backgroundColor = [UIColor colorWithHex:@"#F5F8FA"];
    UIView *view1 = [[UIView alloc]init];
    [contentView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(lineView2.mas_bottom);
        make.height.mas_equalTo(170);
    }];
   
    UILabel *label0 = [[UILabel alloc]init];
    [view1 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(view1.mas_top);
        make.height.mas_equalTo(50);
    }];
    label0.text = @"人气榜单";
    label0.font = [UIFont systemFontOfSize:15];

    UIButton *interestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view1 addSubview:interestButton];
    [interestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label0.mas_bottom);
    }];
    [interestButton setImage:[UIImage imageNamed:@"xqdr_pc"] forState:UIControlStateNormal];
    [interestButton addTarget:self action:@selector(interestButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *authenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view1 addSubview:authenButton];
    [authenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label0.mas_bottom);
    }];
    [authenButton addTarget:self action:@selector(authenButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [authenButton setImage:[UIImage imageNamed:@"rzdk_pc"] forState:UIControlStateNormal];
    NSArray *array = @[interestButton,authenButton];
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    UIView *lineView3 = [[UIView alloc]init];
    [contentView addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom);
        make.height.mas_equalTo(11);
    }];
    lineView3.backgroundColor = [UIColor colorWithHex:@"#F5F8FA"];
    
    UIView *view2 = [[UIView alloc]init];
    [contentView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(lineView3.mas_bottom);
        make.height.mas_equalTo(537);
    }];

    UIView *view22 = [[UIView alloc]init];
    [view2 addSubview:view22];
    [view22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view2.mas_top);
        make.height.mas_equalTo(50);
    }];

    UILabel *label1 = [[UILabel alloc]init];
    [view22 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(view22.mas_top);
        make.height.mas_equalTo(50);
    }];
    label1.text = @"圈子";
    label1.font = [UIFont systemFontOfSize:15];

    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view22 addSubview:moreButton];
    [moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(60);
    }];
    [moreButton setTitle:@"更多 >" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    moreButton.titleLabel.font = [UIFont systemFontOfSize:13];

    UIButton *clubButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:clubButton1];
    [clubButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view22.mas_bottom);
        
    }];
    [clubButton1 setImage:[UIImage imageNamed:@"cd_pc"] forState:UIControlStateNormal];
    
    UIButton *clubButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:clubButton2];
    
    [clubButton2 setImage:[UIImage imageNamed:@"wj_pc"] forState:UIControlStateNormal];
    [clubButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(clubButton1.mas_bottom).offset(10);
        
    }];
    UIButton *clubButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:clubButton3];

    [clubButton3 setImage:[UIImage imageNamed:@"wj_pc"] forState:UIControlStateNormal];
    [clubButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(clubButton2.mas_bottom).offset(10);
        
    }];
    NSArray *array2 = [NSArray arrayWithObjects:clubButton1,clubButton2,clubButton3, nil];
    [array2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(150);
    }];
    
    [contentView addSubview:self.collectionView];
   
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
    
   
    int viewHeight = (int)(self.itemsArray.count /2);
   
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(view2.mas_bottom);
        make.height.mas_equalTo(viewHeight * 280);
    }];
    [self.collectionView reloadData];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.collectionView);
    }];
    
}

#pragma mark Actions
- (void)interestButtonAction
{
    InterestMainViewController *vc = [[InterestMainViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)authenButtonAction
{
    AuthenMainViewController *vc = [[AuthenMainViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark UUMarqueeViewDelegate
- (NSUInteger)numberOfVisibleItemsForMarqueeView:(UUMarqueeView*)marqueeView;
{
    return 2;
}
- (NSArray*)dataSourceArrayForMarqueeView:(UUMarqueeView*)marqueeView;
{
    NSArray *array = [NSArray arrayWithObjects:@"abcdefghisesf",@"2242341414",@"asdf2r341341",@"asdfa234231111",@"abcdefghisesf" ,nil];
    return array;
}
- (void)createItemView:(UIView*)itemView forMarqueeView:(UUMarqueeView*)marqueeView;
{
    //itemView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    itemView.backgroundColor = [UIColor whiteColor];
    UILabel *content = [[UILabel alloc] init];
    [itemView addSubview:content];
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.edges.mas_equalTo(0);
        make.left.mas_equalTo(18);
         make.top.bottom.mas_equalTo(0);
    }];
    content.textColor = [UIColor lightGrayColor];
    content.font = [UIFont systemFontOfSize:12.0f];
    content.tag = 1001;
}

- (void)updateItemView:(UIView*)itemView withData:(id)data forMarqueeView:(UUMarqueeView*)marqueeView;
{
    UILabel *content = [itemView viewWithTag:1001];
    content.text = @"10.09 14:15 杭州某地发生居民楼倒塌,暂没有造成人员伤亡";
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

#pragma mark 懒加载
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
        _collectionView.scrollEnabled = NO;
        [_collectionView registerNib:[UINib nibWithNibName:@"PickCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PickCollectionViewCellID"];
    }
    return _collectionView;
}
#pragma mark lazyLoad

- (UUMarqueeView *)marquee
{
    if (!_marquee) {
        _marquee = [[UUMarqueeView alloc]init];
        _marquee.delegate = self;
        _marquee.timeIntervalPerScroll = 2.0f;
        _marquee.timeDurationPerScroll = 1.0f;
        _marquee.touchEnabled = YES;
        [_marquee start];
    }
    return _marquee;
}


@end

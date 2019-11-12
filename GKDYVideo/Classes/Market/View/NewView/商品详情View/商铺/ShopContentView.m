//
//  ShopContentView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ShopContentView.h"
#import "ShopViewCell.h"
#import "ShopTypeView.h"
@interface ShopContentView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ShopTypeViewDelegate>

@property (strong, nonatomic) ShopTypeView *typeView;
@property (strong, nonatomic) UICollectionView *mainView;

@end


@implementation ShopContentView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.typeView = [[ShopTypeView alloc]init];
        self.typeView.delegate = self;
        [self addSubview:self.typeView];
        [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
        [self addSubview:self.mainView];
        [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.equalTo(self.typeView.mas_bottom);
        }];
    }
    return self;
}



#pragma mark collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 8;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"ShopViewCellID";
    ShopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(kWindowWidth/2-10, 215);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(10 , 5 , 10,5);
}

#pragma mark ShopTypeViewDelegate

- (void)typeViewWithIndex:(NSInteger)buttonIndex;
{
    NSLog(@"buttonIndex");
}

- (UICollectionView *)mainView
{
    if (!_mainView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _mainView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        [_mainView registerNib:[UINib nibWithNibName:@"ShopViewCell" bundle:nil] forCellWithReuseIdentifier:@"ShopViewCellID"];
        _mainView.backgroundColor = kBgColor;
    }
    return _mainView;
}


@end

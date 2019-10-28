//
//  GoodDetailView3.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GoodDetailView3.h"
#import "NewLikeCollectionViewCell.h"

@interface GoodDetailView3()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic)UICollectionView *collectionView;

@end

@implementation GoodDetailView3

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIView *view0 = [[UIView alloc]init];
        [self addSubview:view0];
        [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
       // view0.backgroundColor = kBgColor;
        UILabel *label00 = [[UILabel alloc]init];
        [view0 addSubview:label00];
        [label00 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view0);
        }];
        //label00.backgroundColor = kBgColor;
        label00.textAlignment = NSTextAlignmentCenter;
        label00.textColor = kPickColor;
        label00.font = [UIFont systemFontOfSize:15];
        label00.text = @"-----你可能还喜欢-----";
        
        [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.equalTo(view0.mas_bottom);
            make.height.mas_equalTo(1200);
        }];
    }
    return self;
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
    if ([self.delegate respondsToSelector:@selector(view3WithCollectionViewClick:)]) {
        [self.delegate view3WithCollectionViewClick:indexPath.row];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(170*kWindowWidth/375, 265*kWindowWidth/375);
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
        _collectionView.scrollEnabled = NO;
        
    }
    return _collectionView;
}

@end

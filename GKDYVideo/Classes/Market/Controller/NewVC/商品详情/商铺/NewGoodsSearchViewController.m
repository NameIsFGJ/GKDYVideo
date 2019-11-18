//
//  NewGoodsSearchViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewGoodsSearchViewController.h"
#import "UIViewController+Hidden.h"
#import "NewGoodsSearchViewCell.h"
@interface NewGoodsSearchViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (weak, nonatomic) IBOutlet UIView *view0;
@property (weak, nonatomic) IBOutlet UIView *collectionView;
@property (strong, nonatomic) UICollectionView *hotView;
@property (strong, nonatomic) NSArray *itemsArray;
@end

@implementation NewGoodsSearchViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self makeUI];
    
    
}

- (void)makeUI
{
    if (IS_iPhoneX) {
        self.heightConstraint.constant = 108;
    }else
    {
        self.heightConstraint.constant = 64;
    }
    
    self.view0.layer.cornerRadius = 10;
    self.view0.layer.masksToBounds = YES;
    
    self.itemsArray = [NSArray arrayWithObjects:@"拖鞋",@"毛衣",@"的形式色",@"的形式色是谁的",@"34", nil];
    
    [self.collectionView addSubview:self.hotView];
    [self.hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.hotView reloadData];
    
}

- (IBAction)backButtonAction:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.itemsArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"NewGoodsSearchViewCellID";
    NewGoodsSearchViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    NSLog(@"itemsArray  =%@",self.itemsArray[indexPath.row]);
    cell.titleLabel.text = self.itemsArray[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *string = self.itemsArray[indexPath.row];
    CGFloat width = [string boundingRectWithSize:CGSizeMake(1000, 30) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width;
   
    
    return CGSizeMake(width +20, 30);
}
#pragma mark  lazyLoad
- (UICollectionView *)hotView
{
    if (!_hotView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _hotView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _hotView.delegate = self;
        _hotView.dataSource = self;
        [_hotView registerNib:[UINib nibWithNibName:@"NewGoodsSearchViewCell" bundle:nil] forCellWithReuseIdentifier:@"NewGoodsSearchViewCellID"];
        _hotView.backgroundColor = kWhiteColor;
        
    }
    return _hotView;
}

@end

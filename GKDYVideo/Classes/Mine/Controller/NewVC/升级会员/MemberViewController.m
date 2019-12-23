//
//  MemberViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MemberViewController.h"
#import "VipCollectionViewCell.h"
#import "MemberHistoryViewController.h"
#import "MemberBredgeViewController.h"
@interface MemberViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic)UICollectionView *mainView;
@end

@implementation MemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"漫饭会员";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"购买记录" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [rightButton addTarget:self action:@selector(pushHistoryViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)makeUI
{
        UIView *lineView1 = [[UIView alloc]init];
        [self.view addSubview:lineView1];
        [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(KTopViewHeight);
            make.height.mas_equalTo(.3);
        }];
        lineView1.backgroundColor = [UIColor lightGrayColor];
    
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight+10);
        make.height.mas_equalTo(230);
    }];
    
    UIImageView *imageView0 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"member_bg"]];
    [view0 addSubview:imageView0];
    [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0);
        make.height.mas_equalTo(213);
    }];
    
    UIButton *dredgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:dredgeButton];
    [dredgeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(138, 66));
    }];
    [dredgeButton setImage:[UIImage imageNamed:@"dredgeImage"] forState:UIControlStateNormal];
    [dredgeButton addTarget:self action:@selector(dredgeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view1 = [[UIView alloc]init];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom).offset(20);
        make.height.mas_equalTo(140);
        
    }];
    
    UILabel *label0 = [[UILabel alloc]init];
    [view1 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(view1.mas_top).offset(5);
    }];
    label0.font = [UIFont systemFontOfSize:18];
    label0.textColor = [UIColor blackColor];
    label0.text = @"会员福利";
    
    UIView *view11 = [[UIView alloc]init];
    [view1 addSubview:view11];
    [view11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.bottom.mas_equalTo(-12);
        make.top.equalTo(label0.mas_bottom).offset(12);
    }];
    
    view11.layer.masksToBounds = YES;
    view11.layer.borderWidth = .5;
    view11.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    NSArray *imageArray = @[@"member_image1",@"member_image2",@"member_image3",@"member_image4"];
    NSArray *titleArray = @[@"八折",@"礼包",@"返利",@"正品抢购"];
    for (int i = 0; i < 4; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view11 addSubview:btn];
        //[btn setBackgroundColor:[UIColor blueColor]];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo((kWindowWidth-12*2)/4 *i);
            make.top.mas_equalTo(10);
            // make.width.mas_equalTo((kWindowWidth-12*2)/4);
            make.bottom.equalTo(view11.mas_bottom);
            // make.bottom.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake((kWindowWidth-12*2)/4,75));
            
        }];
        
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageArray[i]]];
        [btn addSubview:imageView];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(40);
        }];
        
        UILabel *label = [[UILabel alloc]init];
        [btn addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(imageView.mas_bottom).offset(10);
        }];
        label.textColor = [UIColor colorWithHex:@"#c0a069"];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        label.text = titleArray[i];
        
    }
    
    UIView *view2 = [[UIView alloc]init];
    [self.view addSubview:view2];
    view2.backgroundColor = [UIColor colorWithHex:@""];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom).offset(5);
    }];
    // view2.backgroundColor = [UIColor blueColor];
    
    UILabel *label2 = [[UILabel alloc]init];
    [view2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(view2.mas_top).offset(5);
    }];
    label2.font = [UIFont systemFontOfSize:18];
    label2.textColor = [UIColor blackColor];
    label2.text = @"VIP特权专卖";
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:moreButton];
    [moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label2.mas_centerY);
        make.right.mas_equalTo(-12);
        make.size.mas_equalTo(CGSizeMake(80, 35));
    }];
    [moreButton setTitle:@"查看更多 >" forState:UIControlStateNormal];
    moreButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [moreButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [view2 addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(label2.mas_bottom).offset(10);
    }];
    
}

#pragma mark Actions
- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushHistoryViewController
{
    MemberHistoryViewController *vc = [[MemberHistoryViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)dredgeButtonAction
{
    NSLog(@"立即开通");
    MemberBredgeViewController *vc = [[MemberBredgeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)buttonAction:(UIButton *)btn
{
    if (btn.tag == 100)
    {
        NSLog(@"八折");
    }else if (btn.tag == 101)
    {
        NSLog(@"礼包");
    }else if (btn.tag == 102)
    {
        NSLog(@"返利");
    }else if (btn.tag == 103)
    {
        NSLog(@"正品抢购");
    }
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"VipCollectionViewCellID";
    VipCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = .5;
    cell.layer.masksToBounds = YES;
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(130, 180);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

#pragma mark lazyLoad
- (UICollectionView *)mainView
{
    if (!_mainView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        _mainView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_mainView registerNib:[UINib nibWithNibName:@"VipCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"VipCollectionViewCellID"];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        _mainView.backgroundColor = [UIColor whiteColor];
    }
    return _mainView;
}
@end

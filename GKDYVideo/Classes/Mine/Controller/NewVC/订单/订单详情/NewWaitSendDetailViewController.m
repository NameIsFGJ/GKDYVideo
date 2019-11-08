//
//  NewWaitSendDetailViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewWaitSendDetailViewController.h"
#import "NewLikeCollectionViewCell.h"
#import "NewWaitPayReasonView.h"
#import "NewWaitSendBackPayViewController.h"
@interface NewWaitSendDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UIScrollView *mainView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NewWaitPayReasonView *reasonView;

@end

@implementation NewWaitSendDetailViewController

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
    label.text = @"订单详情";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-60);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    
    UIView *contentView = [[UIView alloc]init];
    [self.mainView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainView);
        make.width.equalTo(self.mainView);
    }];
    contentView.backgroundColor = kBgColor;
    //-----------------view0------------------------
    UIView *view0 = [[UIView alloc]init];
    [contentView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(90);
    }];
    view0.backgroundColor = [UIColor redColor];
    
    UIImageView *bgImageView = [[UIImageView alloc]init];
    bgImageView.image = [UIImage imageNamed:@"waitPayBg"];
    [view0 addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIView *view00 = [[UIView alloc]init];
    [bgImageView addSubview:view00];
    [view00 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgImageView);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    UIImageView *imageView00 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"time"]];
    [view00 addSubview:imageView00];
    [imageView00 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.equalTo(view00);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    UILabel *label00 = [[UILabel alloc]init];
    [view00 addSubview:label00];
    [label00 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view00);
        make.left.equalTo(imageView00.mas_right).offset(5);
        
    }];
    label00.text = @"等待付款";
    label00.font = [UIFont systemFontOfSize:15];
    label00.textColor = [UIColor whiteColor];
    
    UILabel *label01 = [[UILabel alloc]init];
    [bgImageView addSubview:label01];
    [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(view00).offset(-12);
    }];
    label01.text = @"剩余时间:21小时12分";
    label01.textColor = [UIColor whiteColor];
    label01.font = [UIFont systemFontOfSize:15];
    
    UILabel *label02 = [[UILabel alloc]init];
    [bgImageView addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(view00).offset(12);
    }];
    label02.text = @"需付款: ¥421.50";
    label02.textColor = [UIColor whiteColor];
    label02.font = [UIFont systemFontOfSize:15];
    
    
    //-----------------view1------------------------
    
    
    UIView *view1 = [[UIView alloc]init];
    [contentView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(82);
        make.top.equalTo(view0.mas_bottom);
    }];
    view1.backgroundColor = [UIColor whiteColor];
    
    UILabel *label11 = [[UILabel alloc]init];
    [view1 addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(10);
    }];
    
    label11.text = @"刘刚";
    label11.textColor = [UIColor blackColor];
    label11.font = [UIFont systemFontOfSize:15];
    
    UILabel *label12 = [[UILabel alloc]init];
    [view1 addSubview:label12];
    [label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label11.mas_right).offset(15);
        make.top.mas_equalTo(15);
    }];
    
    label12.text = @"155****2137";
    label12.textColor = [UIColor blackColor];
    label12.font = [UIFont systemFontOfSize:15];
    
    UILabel *label13 = [[UILabel alloc]init];
    [view1 addSubview:label13];
    [label13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(-5);
        make.width.equalTo(view1.mas_width).multipliedBy(.7);
    }];
    
    label13.text = @"浙江省杭州市江干区凯旋路371号紫玉名府2幢401室内";
    label13.textColor = [UIColor blackColor];
    label13.font = [UIFont systemFontOfSize:15];
    label13.numberOfLines = 2;
    
    UILabel *label14 = [[UILabel alloc]init];
    [view1 addSubview:label14];
    [label14 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view1.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(10, 12));
        make.right.mas_equalTo(-10);
    }];
    label14.text = @">";
    label14.textColor = [UIColor blackColor];
    label14.font = [UIFont systemFontOfSize:20];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView1Action)];
    [view1 addGestureRecognizer:tap];
    
    
    UIImageView *lineView1 = [[UIImageView alloc]init];
    [view1 addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    lineView1.image = [UIImage imageNamed:@"dz_icon"];
    
    //-----------------view2------------------------
    
    UIView *view2 = [[UIView alloc]init];
    [contentView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom).offset(5);
        make.height.mas_equalTo(135);
    }];
    view2.backgroundColor = [UIColor whiteColor];
    
    UIButton *button21 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:button21];
    [button21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    //   button2
    [button21 setTitle:@"压店旗舰店 >" forState:UIControlStateNormal];
    [button21 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button21.titleLabel.font = [UIFont systemFontOfSize:13];
    UIView *view22 = [[UIView alloc]init];
    [view2 addSubview:view22];
    [view22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(button21.mas_bottom);
    }];
    UIImageView *imageView2 = [[UIImageView alloc]init];
    [view22 addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view22.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    imageView2.backgroundColor = [UIColor blueColor];
    
//    UILabel *label20 = [[UILabel alloc]init];
//    [view2 addSubview:label20];
//    [label20 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(imageView2.mas_right).offset(15);
//        make.top.equalTo(imageView2.mas_top);
//    }];
//    label20.text = @"奢华祖母绿戒指";
//    label20.textColor = [UIColor blackColor];
//    label20.font = [UIFont systemFontOfSize:15];
//
    UILabel *label21 = [[UILabel alloc]init];
    [view2 addSubview:label21];
    [label21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView2.mas_right).offset(15);
        make.top.equalTo(imageView2.mas_top);
    }];
    label21.text = @"奢华祖母绿戒指";
    label21.textColor = [UIColor blackColor];
    label21.font = [UIFont systemFontOfSize:15];
    
    UILabel *label22 = [[UILabel alloc]init];
    [view2 addSubview:label22];
    [label22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label21.mas_left);
        make.top.equalTo(label21.mas_bottom).offset(5);
    }];
    label22.text = @"1.71克拉哥伦比亚素面祖母绿裸石";
    label22.textColor = [UIColor lightGrayColor];
    label22.font = [UIFont systemFontOfSize:10];
    
    UILabel *label23 = [[UILabel alloc]init];
    [view2 addSubview:label23];
    [label23 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label21.mas_left);
        make.bottom.equalTo(imageView2.mas_bottom);
    }];
    label23.text = @"¥311.50";
    label23.textColor = kPickColor;
    label23.font = [UIFont systemFontOfSize:15];
    
    UIButton *backPayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:backPayButton];
    [backPayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.bottom.equalTo(label23.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    [backPayButton setTitle:@"退款" forState:UIControlStateNormal];
    [backPayButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    backPayButton.titleLabel.font = [UIFont systemFontOfSize:15];
    backPayButton.layer.cornerRadius = 15;
    backPayButton.layer.borderWidth = .5;
    backPayButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    backPayButton.layer.masksToBounds = YES;
    [backPayButton addTarget:self action:@selector(backPayButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //    view22.backgroundColor = [UIColor lightGrayColor];
    //-----------------view3------------------------
    
    UIView *view3 = [[UIView alloc]init];
    [contentView addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view2.mas_bottom).offset(5);
        make.height.mas_equalTo(48);
    }];
    view3.backgroundColor = [UIColor whiteColor];
    UILabel *label31 = [[UILabel alloc]init];
    [view3 addSubview:label31];
    [label31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        // make.top.mas_equalTo(0);
        make.centerY.equalTo(view3);
    }];
    label31.text = @"订单编号";
    label31.font = [UIFont systemFontOfSize:15];
    label31.textColor = [UIColor blackColor];
    
    UILabel *label32 = [[UILabel alloc]init];
    [view3 addSubview:label32];
    [label32 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        // make.top.mas_equalTo(0);
        make.centerY.equalTo(view3);
    }];
    label32.text = @"24502191939493";
    label32.font = [UIFont systemFontOfSize:15];
    label32.textColor = [UIColor colorWithHex:@"#666666"];
    
    //-----------------view4------------------------
    
    UIView *view4 = [[UIView alloc]init];
    [contentView addSubview:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view3.mas_bottom).offset(1);
        make.height.mas_equalTo(48);
    }];
    view4.backgroundColor = [UIColor whiteColor];
    UILabel *label41 = [[UILabel alloc]init];
    [view4 addSubview:label41];
    [label41 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view4);
    }];
    label41.text = @"创建时间";
    label41.font = [UIFont systemFontOfSize:15];
    label41.textColor = [UIColor blackColor];
    
    UILabel *label42 = [[UILabel alloc]init];
    [view4 addSubview:label42];
    [label42 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(view4);
    }];
    label42.text = @"2019-10-12 05:31:21";
    label42.font = [UIFont systemFontOfSize:15];
    label42.textColor = [UIColor colorWithHex:@"#666666"];
    
    //-----------------view8------------------------
    
    UIView *view8 = [[UIView alloc]init];
    [contentView addSubview:view8];
    [view8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view4.mas_bottom).offset(1);
        make.height.mas_equalTo(48);
    }];
    view8.backgroundColor = [UIColor whiteColor];
    UILabel *label81 = [[UILabel alloc]init];
    [view8 addSubview:label81];
    [label81 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view8);
    }];
    label81.text = @"付款时间";
    label81.font = [UIFont systemFontOfSize:15];
    label81.textColor = [UIColor blackColor];
    
    UILabel *label82 = [[UILabel alloc]init];
    [view8 addSubview:label82];
    [label82 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(view8);
    }];
    label82.text = @"2019-10-13 12:51:12";
    label82.font = [UIFont systemFontOfSize:15];
    label82.textColor = [UIColor colorWithHex:@"#666666"];
    
    
    //-----------------view5------------------------
    
    UIView *view5 = [[UIView alloc]init];
    [contentView addSubview:view5];
    [view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(48);
        make.top.equalTo(view8.mas_bottom).offset(1);
    }];
    view5.backgroundColor = [UIColor whiteColor];
    
    UIButton *button51 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view5 addSubview:button51];
    [button51 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.equalTo(view5.mas_width).multipliedBy(.5);
    }];
    UIButton *button52 = [UIButton buttonWithType:UIButtonTypeCustom];
    ;
    [view5 addSubview:button52];
    [button52 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.equalTo(view5.mas_width).multipliedBy(.5);
    }];
    
    [button51 setImage:[UIImage imageNamed:@"xx_icon"] forState:UIControlStateNormal];
    [button51 setTitle:@"联系卖家" forState:UIControlStateNormal];
    [button51 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button51.titleLabel.font = [UIFont systemFontOfSize:16];
    button51.titleEdgeInsets = UIEdgeInsetsMake(0,5, 0, -5);
    [button51 addTarget:self action:@selector(button51Action) forControlEvents:UIControlEventTouchUpInside];
    [button52 setImage:[UIImage imageNamed:@"dh_icon"] forState:UIControlStateNormal];
    [button52 setTitle:@"拨打电话" forState:UIControlStateNormal];
    [button52 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button52.titleLabel.font = [UIFont systemFontOfSize:16];
    button52.titleEdgeInsets = UIEdgeInsetsMake(0,5, 0, -5);
    [button52 addTarget:self action:@selector(button52Action) forControlEvents:UIControlEventTouchUpInside];
    UIView *view6 = [[UIView alloc]init];
    [contentView addSubview:view6];
    [view6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view5.mas_bottom).offset(1);
        make.height.mas_equalTo(50);
    }];
    view6.backgroundColor = kBgColor;
    UILabel *label61 = [[UILabel alloc]init];
    [view6 addSubview:label61];
    [label61 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view6);
    }];
    label61.backgroundColor = kBgColor;
    label61.textAlignment = NSTextAlignmentCenter;
    label61.textColor = kPickColor;
    label61.font = [UIFont systemFontOfSize:21];
    label61.text = @"-----你可能还喜欢-----";
    
    // UIView *view7 = [[UIView alloc]init];
    
    [contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(view6.mas_bottom);
        make.height.mas_equalTo(280*4);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.collectionView);
    }];
    
    UIView *bottomView = [[UIView alloc]init];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(63);
    }];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottomView addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(bottomView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 33));
    }];
    [button1 setTitle:@"修改地址" forState:UIControlStateNormal];
    button1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button1.layer.borderWidth = .5;
    button1.layer.masksToBounds = YES;
    //[button1 setBackgroundColor:kPickColor];
    [button1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:15];
    [button1 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];
    
    // 隐藏视图
    
    self.reasonView = [[NewWaitPayReasonView alloc]init];
    [self.view addSubview:self.reasonView];
    self.reasonView.frame = self.view.bounds;
    self.reasonView.hidden = YES;
}


#pragma mark Action

- (void)backPayButtonAction
{
    NSLog(@"点击退款");
    NewWaitSendBackPayViewController *vc = [[NewWaitSendBackPayViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapView1Action
{
    NSLog(@"点击view1");
}

// 付款
- (void)buttonAction1
{
    NSLog(@"付款");
}

// 取消订单
- (void)buttonAction2
{
    NSLog(@"取消订单");
    self.reasonView.hidden = !self.reasonView.hidden;
    
}
// 修改地址
- (void)buttonAction3
{
    NSLog(@"修改地址");
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(170*kWindowWidth/375, 265*kWindowWidth/375);
}

#pragma mark lazyLoad
- (UIScrollView *)mainView
{
    if (!_mainView) {
        _mainView = [[UIScrollView alloc]init];
    }
    return _mainView;
}

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

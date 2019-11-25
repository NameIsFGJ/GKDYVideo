//
//  PickRecommendDetailViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/25.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "PickRecommendDetailViewController.h"
#import "PickRecommendDetailCell.h"
#import "PickRecommendDetailTbCell.h"
@interface PickRecommendDetailViewController ()<UINavigationControllerDelegate,SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIView *view0;
@property (strong, nonatomic) SDCycleScrollView *scrollView;
@property (strong, nonatomic) UIView *view1;
@property (strong, nonatomic) UIView *view2;
@property (strong, nonatomic) UIView *view3;
@property (strong, nonatomic) UIView *view4;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation PickRecommendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.delegate =self;
    
    [self makeScrollView];
    [self makeFixedView];
}

- (void)makeScrollView
{
    UIScrollView *mainView = [[UIScrollView alloc]init];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIView *contentView = [[UIView alloc]init];
    [mainView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.edges.equalTo(mainView);
        make.top.mas_equalTo(-KStatusBarHeight);
        make.left.right.bottom.mas_equalTo(0);
        make.width.equalTo(mainView);
       
    }];
    
    self.view0 = [[UIView alloc]init];
    [contentView addSubview:self.view0];
    [self.view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(280);
    }];
 
    [self.view0 addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.view1 = [[UIView alloc]init];
    [contentView addSubview:self.view1];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(180);
        make.top.equalTo(self.view0.mas_bottom);
    }];
   
    UIView *view10 = [[UIView alloc]init];
    [self.view1 addSubview:view10];
    [view10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.equalTo(self.view1.mas_height).multipliedBy(.4);
        
    }];
    
    UIImageView *headImageView = [[UIImageView alloc]init];
    [view10 addSubview:headImageView];
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view10.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    headImageView.backgroundColor = [UIColor redColor];
    headImageView.layer.cornerRadius = 44/2;
    headImageView.layer.masksToBounds = YES;
    
    UILabel *label10 = [[UILabel alloc]init];
    [view10 addSubview:label10];
    [label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headImageView.mas_right).offset(5);
        make.centerY.equalTo(view10.mas_centerY).offset(-10);
    }];
    label10.text = @"小木森林";
    label10.font = kFontSize(16);
    
    UILabel *label11 = [[UILabel alloc]init];
    [view10 addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headImageView.mas_right).offset(5);
        make.centerY.equalTo(view10.mas_centerY).offset(10);
    }];
    label11.text = @"韩系冷系列花匠";
    label11.font = kFontSize(14);
    
    UIButton *followingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view10 addSubview:followingButton];
    [followingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(view10.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
    followingButton.backgroundColor = kPickColor;
    followingButton.layer.cornerRadius = 9;
    followingButton.layer.masksToBounds = YES;
    [followingButton setTitle:@"关注" forState:UIControlStateNormal];
    followingButton.titleLabel.font = kFontSize(15);
    
    UIView *view11 = [[UIView alloc]init];
    [self.view1 addSubview:view11];
    [view11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view10.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.equalTo(self.view1.mas_height).multipliedBy(.3);
        
    }];
    
    UILabel *topicLabel = [[UILabel alloc]init];
    [view11 addSubview:topicLabel];
    [topicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view11).insets(UIEdgeInsetsMake(0, 10, 0, -10));
    }];
    topicLabel.text = @"4.0模式开启!得分2年级后新低,但他依旧是巅峰";
    topicLabel.numberOfLines = 0;
    topicLabel.font = kFontSize(20);
    UIView *view12 = [[UIView alloc]init];
    [self.view1 addSubview:view12];
    [view12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view11.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.equalTo(self.view1.mas_height).multipliedBy(.3);
    }];
    
    UIButton *button122 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view12 addSubview:button122];
    [button122 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(view12.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(50, 23));
    }];
    [button122 setTitleColor:kStringColor forState:UIControlStateNormal];
   
    [button122 setTitle:@"122" forState:UIControlStateNormal];
    [button122  setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    button122.titleLabel.font = kFontSize(13);
    [button122 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleRight imageTitleSpace:3];
    
    UIButton *button121 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view12 addSubview:button121];
    [button121 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(button122.mas_left).offset(-10);
        make.centerY.equalTo(view12.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(50, 23));
    }];
    [button121 setTitleColor:kStringColor forState:UIControlStateNormal];
    
    [button121 setTitle:@"121" forState:UIControlStateNormal];
    [button121  setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    button121.titleLabel.font = kFontSize(13);
    [button121 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleRight imageTitleSpace:3];
    
    UIButton *button120 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view12 addSubview:button120];
    [button120 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(button121.mas_left).offset(-10);
        make.centerY.equalTo(view12.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(50, 23));
    }];
    [button120 setTitleColor:kStringColor forState:UIControlStateNormal];
    
    [button120 setTitle:@"120" forState:UIControlStateNormal];
    [button120  setImage:[UIImage imageNamed:@"打赏"] forState:UIControlStateNormal];
    button120.titleLabel.font = kFontSize(13);
    [button120 layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleRight imageTitleSpace:3];
    
    UIView *lineView12 = [[UIView alloc]init];
    [view12 addSubview:lineView12];
    [lineView12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(.4);
    }];
    lineView12.backgroundColor = kBgColor;
    
    self.view2 = [[UIView alloc]init];
    [contentView addSubview:self.view2];
    NSString *string = @"        事情大概是这样，上赛季加盟湖人之后，詹姆斯并没有带队打出预期表现，湖人依然无缘季后赛，詹姆斯个人还遭受了腹股沟伤病，这是他生涯最为严重的一次伤病。一时间，有关“詹姆斯巅峰已过”的论调随处可见，仿佛只过了一年国王就已经失去了他的统治力。不得不承认的是，上赛季确实是詹姆斯生涯比较惨淡的一个赛季。在此之前，他已经连续13年打进季后赛，个人连续11年入选了一阵，MVP排名也是连续13年没有掉出过前五，结果因为伤病和球队战绩不佳，常规赛结束后他只入选了三阵，MVP排名更是掉到了前十之外。场均24.9分7.7篮板11.3助攻，得分新秀以来新低，不过助攻却是生涯最高，目前也是全联盟唯一一个助攻上双的球员，保持下去，他甚至有可能要冲击助攻王。此外，湖人也在詹姆斯带领下高歌猛进，战绩13胜2负高居联盟第一，最新的MVP排行榜上，詹姆斯也稳坐第二位置。显然，他已经从三阵打回了一阵，并且又一次走在争夺总冠军的路上却是生涯最高，目前也是全联盟唯一一个助攻上双的球员，保持下去，他甚至有可能要冲击助攻王。此外，湖人也在詹姆斯带领下高歌猛进，战绩13胜2负高居联盟第一，最新的MVP排行榜上，詹姆斯也稳坐第二位置。显然，他已经从三阵打回了一阵，并且又一次走在争夺总冠军的路上";
    
    CGFloat height = [string boundingRectWithSize:CGSizeMake(kWindowWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
    
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(height + 150+ 50);
        make.top.equalTo(self.view1.mas_bottom);
    }];
    
    UILabel *contentLabel = [[UILabel alloc]init];
    [self.view2 addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.edges.mas_equalTo(0);
    }];
    contentLabel.numberOfLines = 0;
    //contentLabel.backgroundColor = [UIColor blueColor];
    contentLabel.font = kFontSize(15);
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:string];
    
    NSTextAttachment *attch = [[NSTextAttachment alloc]init];
    attch.image = [UIImage imageNamed:@"userIcon"];
    attch.bounds = CGRectMake(0, 0, kWindowWidth, 150);
    
    //UIImageView *imageView = [[UIImageView alloc]init];
    //[imageView sd_setImageWithURL:[NSURL URLWithString:@""]];
    
    //attch.image = imageView.image;
    
    NSAttributedString *mutabstring = [NSAttributedString attributedStringWithAttachment:attch];
    
    [attri appendAttributedString:mutabstring];
    
    [attri insertAttributedString:mutabstring atIndex:string.length/2];
    
    contentLabel.attributedText = attri;
    
    self.view3 = [[UIView alloc]init];
    [contentView addSubview:self.view3];
    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(190);
        make.top.equalTo(self.view2.mas_bottom);
    }];

    UIView *lineView30 = [[UIView alloc]init];
    [self.view3 addSubview:lineView30];
    [lineView30 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(8);
    }];
    lineView30.backgroundColor = kBgColor;
    
    UIView *view30 = [[UIView alloc]init];
    [self.view3 addSubview:view30];
    [view30 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    UILabel *label30 = [[UILabel alloc]init];
    [view30 addSubview:label30];
    [label30 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(view30.mas_centerY);
    }];
    label30.text = @"相关作品";
    label30.font = kFontSize(15);
    
    UIView *view31 = [[UIView alloc]init];
    [self.view3 addSubview:view31];
    [view31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(view30.mas_bottom);
    }];
    
    [view31 addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.centerY.equalTo(view31.mas_centerY);
        make.height.mas_equalTo(130);
       
    }];
    
    self.view4 = [[UIView alloc]init];
    [contentView addSubview:self.view4];
    [self.view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(220 *3 +40 +8 +55 +1);
        make.top.equalTo(self.view3.mas_bottom);
    }];
   // self.view4.backgroundColor = [UIColor orangeColor];
    
    UIView *lineView40 = [[UIView alloc]init];
    [self.view4 addSubview:lineView40];
    [lineView40 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(8);
    }];
    lineView40.backgroundColor = kBgColor;
    
    UIView *view40 = [[UIView alloc]init];
    [self.view4 addSubview:view40];
    [view40 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(lineView40.mas_bottom);
        make.height.mas_equalTo(40);
    }];
    
    UILabel *label40 = [[UILabel alloc]init];
    [view40 addSubview:label40];
    [label40 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view40.mas_centerY);
      //  make.height.mas_equalTo(40);
    }];
    label40.font = kFontSize(15);
    label40.text = @"点评 (200)";
    
    [self.view4 addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label40.mas_bottom);
        make.height.mas_equalTo(220 *3);
    }];
    
    
    UIView *lineView41 = [[UIView alloc]init];
    [self.view4 addSubview:lineView41];
    [lineView41 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.tableView.mas_bottom).offset(0);
        make.height.mas_equalTo(.5);
    }];
    lineView40.backgroundColor = kBgColor;
    
    UIButton *btn40 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view4 addSubview:btn40];
    [btn40 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.top.equalTo(lineView41.mas_bottom).offset(0);
    }];
    [btn40 setTitle:@"展开300条评论" forState:UIControlStateNormal];
    btn40.titleLabel.font = kFontSize(15);
    [btn40 setTitleColor:kPickColor forState:UIControlStateNormal];
    
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view4.mas_bottom);
    }];
    
}

- (void)makeFixedView
{
    UIButton *popButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:popButton];
    [popButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(KStatusBarHeight);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [popButton setImage:[UIImage imageNamed:@"popBlackImage"] forState:UIControlStateNormal];
    [popButton addTarget:self action:@selector(popButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:shareButton];
    [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(KStatusBarHeight);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [shareButton setImage:[UIImage imageNamed:@"shareImage"] forState:UIControlStateNormal];
     [shareButton addTarget:self action:@selector(shareButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:commentButton];
    [commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(kWindowHeight-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [commentButton setImage:[UIImage imageNamed:@"pl"] forState:UIControlStateNormal];
    
    UIButton *giveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:giveButton];
    [giveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(commentButton.mas_right).offset(10);
        make.top.mas_equalTo(kWindowHeight-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [giveButton setImage:[UIImage imageNamed:@"ds"] forState:UIControlStateNormal];
    
    UIButton *zanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:zanButton];
    [zanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.left.equalTo(commentButton.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(kWindowHeight-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [zanButton setImage:[UIImage imageNamed:@"赞"] forState:UIControlStateNormal];
    
    UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:likeButton];
    [likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(zanButton.mas_left).offset(-10);
        make.top.mas_equalTo(kWindowHeight-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [likeButton setImage:[UIImage imageNamed:@"sc"] forState:UIControlStateNormal];
    
}

- (void)popButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)shareButtonAction
{
    NSLog(@"分享");
}
#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
    BOOL isShowBar = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowBar animated:YES];
}

#pragma mark SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
{
    NSLog(@"图片:%ld 被点击了",index);
}
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index;
{
    
}

#pragma mark SDCycleScrollViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"PickRecommendDetailCellID";
    PickRecommendDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(130, 110);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(0, 5, 0, -5);
}

#pragma mark UITableViewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"PickRecommendDetailTbCellID";
    PickRecommendDetailTbCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 220;
}

#pragma mark lazyLoad

//cycleScrollViewWithFrame
- (SDCycleScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageNamesGroup:[NSArray arrayWithObjects:@"image1",@"image1",@"image1", nil]];
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = kWhiteColor;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"PickRecommendDetailCell" bundle:nil] forCellWithReuseIdentifier:@"PickRecommendDetailCellID"];
        
    }
    return _collectionView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"PickRecommendDetailTbCell" bundle:nil] forCellReuseIdentifier:@"PickRecommendDetailTbCellID"];
        
    }
    return _tableView;
}
@end

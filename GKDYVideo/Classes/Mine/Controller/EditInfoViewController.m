//
//  EditInfoViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/7.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "EditInfoViewController.h"
#import "EditTableViewCell.h"
#import "EditHeadView.h"
@interface EditInfoViewController()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong,nonatomic)EditHeadView *headView;
@end

@implementation EditInfoViewController
- (void)viewDidLoad
{
    
   
    [super viewDidLoad];
    [self creatNav];
    [self creatTableView];
    
}

- (void)creatNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"消息";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(pushMyFriendsVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.leftBarButtonItem = rightItem;
}

- (void)creatTableView
{
    self.headView = [[EditHeadView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 180)];
  //  UIGestureRecognizer *tap = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(changeIconButtonAction)];
       // [self.headView.changeIconImageView addGestureRecognizer:tap];
    [self.headView.changeIconButton addTarget:self action:@selector(changeIconButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headView.changeIconBlackButton addTarget:self action:@selector(changeIconButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 180)];
//    UIView *contentView = [[UIView alloc]init];
//    [headView addSubview:contentView];
//    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.mas_equalTo(0);
//        make.height.mas_equalTo(140);
//    }];
//
//    UIImageView *headPicImageView = [[UIImageView alloc]init];
//    [contentView addSubview:headPicImageView];
//    [headPicImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(90, 90));
//        make.center.equalTo(contentView).offset(0);
//    }];
//    headPicImageView.image = [UIImage imageNamed:@"userIcon"];
//    headPicImageView.layer.cornerRadius = 90/2.0f;
//    headPicImageView.layer.masksToBounds = YES;
//
//    UIImageView *changeIconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"editImage"]];
//    [headPicImageView addSubview:changeIconImageView];
//
//    changeIconImageView.contentMode = UIViewContentModeCenter;
//    [changeIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//      make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];
//    changeIconImageView.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.6];
//
//    UIGestureRecognizer *tap = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(changeIconButtonAction)];
//    [changeIconImageView addGestureRecognizer:tap];
//
//
//    UIButton *changeIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [headView addSubview:changeIconButton];
//    [changeIconButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(110, 15));
//        make.top.equalTo(contentView.mas_bottom).offset(0);
//        make.centerX.mas_equalTo(0);
//        //make.left.mas_equalTo(100);
//    }];
//    [changeIconButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    [changeIconButton setTitle:@"点击更换头像" forState:UIControlStateNormal];
//    [changeIconButton.titleLabel setFont:kFontSize(15)];
//    [changeIconButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
//    [changeIconButton addTarget:self action:@selector(changeIconButtonAction) forControlEvents:UIControlEventTouchUpInside];

    
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    self.tableView.tableHeaderView = self.headView;
    
}
- (void)pushMyFriendsVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeIconButtonAction
{
    NSLog(@"点击头像");
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    //return 6;
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"EditTableViewCellID";
    EditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.titleLabel.text = self.itemsArray[indexPath.row];
    if (indexPath.row == 0)
    {
        cell.infoLabel.hidden = YES;
        cell.contentLabel.text = self.model.nickname;
    }else if (indexPath.row == 1){
        cell.infoLabel.hidden = NO;
        cell.contentLabel.text = [NSString stringWithFormat:@"%ld",self.model.mf_num];
    }else if (indexPath.row == 2){
        cell.infoLabel.hidden = YES;
        cell.contentLabel.text = self.model.signs;
    }else if (indexPath.row == 3){
        cell.infoLabel.hidden = YES;
        NSString *sexString;
        if (self.model.sex == 1) {
            sexString = @"男";
        }else if (self.model.sex == 2){
            sexString = @"女";
        }
        cell.contentLabel.text = sexString;
    }else if (indexPath.row == 4){
        cell.infoLabel.hidden = YES;
        cell.contentLabel.text = self.model.birthday;
    }else if (indexPath.row == 5){
        cell.infoLabel.hidden = YES;
        cell.contentLabel.text = self.model.city;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"EditTableViewCell" bundle:nil] forCellReuseIdentifier:@"EditTableViewCellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSArray arrayWithObjects:@"昵称",@"漫饭号",@"签名",@"性别",@"生日",@"地区", nil];
    }
    return _itemsArray;
}
@end

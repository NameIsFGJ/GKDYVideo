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
#import "UpLoadAvatarNetworking.h"
#import "MyIndexNetworking.h"
#import "EditNickNameViewController.h"
#import "EditMFNumbViewController.h"
#import "EditSignsViewController.h"
#import "BirthPickerView.h"
#import "CityPickerView.h"
#import "SexPickerView.h"
@interface EditInfoViewController()<UITableViewDelegate,UITableViewDataSource,TZImagePickerControllerDelegate>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)EditHeadView *headView;
@property (strong, nonatomic)BirthPickerView *birthView;
@property (strong, nonatomic)CityPickerView *cityView;
@property (strong, nonatomic)SexPickerView *sexView;
@end

@implementation EditInfoViewController
 - (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self networking];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatNav];
    [self creatTableView];
    
}

#pragma mark Action
- (void)networking
{
   // self.model = nil;
    
    [MyIndexNetworking postMyIndex:kUser.user_token completionHandle:^(DataModel * _Nonnull model, NSError * _Nonnull error) {
        self.model = model;
        NSString *head_pic = [NSString stringWithFormat:@"%@%@",kSERVICE,self.model.head_pic];
        [self.headView.headPicImageView sd_setImageWithURL:[NSURL URLWithString:head_pic]];
        [self.tableView reloadData];
    }];
}

- (void)creatNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"消息";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)creatTableView
{
    self.headView = [[EditHeadView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 180)];
    [self.headView.changeIconButton addTarget:self action:@selector(changeIconButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headView.changeIconBlackButton addTarget:self action:@selector(changeIconButtonAction) forControlEvents:UIControlEventTouchUpInside];
   
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    self.tableView.tableHeaderView = self.headView;
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeIconButtonAction
{
    TZImagePickerController *pickerVC = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
    // 允许选择图片
    pickerVC.allowPickingImage = YES;
    [self presentViewController:pickerVC animated:YES completion:^{
        
    }];
}

#pragma mark TZImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto;
{
    UIImage *image = [photos firstObject];
 
    [UpLoadAvatarNetworking postUploadAvatarWithToken:kUser.user_token withAvator:image completion:^(NSInteger code, NSError * _Nonnull error) {
        if (code == 1) {
            self.headView.headPicImageView.image = image;
        }
    }];
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
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
        cell.contentLabel.text = self.model.mf_num;
    }else if (indexPath.row == 2){
        cell.infoLabel.hidden = YES;
        cell.contentLabel.text = self.model.signs;
    }else if (indexPath.row == 3){
        NSLog(@"self.model.sex  =%ld",self.model.sex);
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 昵称
    if (indexPath.row == 0)
    {
        EditNickNameViewController *vc = [[EditNickNameViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) // 漫饭
    {
        EditMFNumbViewController *vc = [[EditMFNumbViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2)// 签名
    {
        EditSignsViewController *vc = [[EditSignsViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3) // 性别
    {
        [self.view addSubview:self.sexView];
        self.sexView.frame = self.view.bounds;
         __weak EditInfoViewController *weakSelf = self;
        self.sexView.block = ^{
            [weakSelf networking];
        };
    }else if (indexPath.row == 4)// 生日
    {
        [self.view addSubview:self.birthView];
        self.birthView.frame = self.view.bounds;
       
        __weak EditInfoViewController *weakSelf = self;
        self.birthView.block = ^{
          
            [weakSelf networking];
        };
    }else if (indexPath.row == 5)// 地区
    {
        [self.view addSubview:self.cityView];
        self.cityView.frame = self.view.bounds;
         __weak EditInfoViewController *weakSelf = self;
        self.cityView.block = ^{
            [weakSelf networking];
        };
    }
}




#pragma mark 懒加载
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

- (BirthPickerView *)birthView
{
    if (!_birthView) {
        _birthView = [[BirthPickerView alloc]init];
    }
    return _birthView;
}

- (CityPickerView *)cityView
{
    if (!_cityView) {
        _cityView = [[CityPickerView alloc]init];
    }
    return _cityView;
}

- (SexPickerView *)sexView
{
    if (!_sexView) {
        _sexView = [[SexPickerView alloc]init];
    }
    return _sexView;
}
@end

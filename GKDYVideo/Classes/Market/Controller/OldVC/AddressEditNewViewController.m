//
//  AddressEditNewViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/9.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddressEditNewViewController.h"
#import "AddressSelectView.h"
#import "AddressNewNetworking.h"
#import "AddressEditNetworking.h"
#import "AddressDefaultNetworking.h"
#import "AddressDeleteNetworking.h"

static NSInteger deCode;

@interface AddressEditNewViewController ()
@property (strong, nonatomic)AddressSelectView *cityView;

@property (strong, nonatomic)UITextField *textfield1;
@property (strong, nonatomic)UITextField *textfield2;
@property (strong, nonatomic)UITextField *textfield3;
@property (strong, nonatomic)UITextField *textfield4;
@property (strong, nonatomic)UITextField *textfield5;

@property (strong, nonatomic)MBProgressHUD *hub;

@property (strong, nonatomic)UISwitch *switchView;

@end

@implementation AddressEditNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeUI];
    [self makeNav];
}

#pragma mark Actions
- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"编辑地址";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushNewAddressAction
{
    NSLog(@"添加新的地址");
}
- (void)makeUI
{
    
   
   // self.hub.hidden = YES;//
    // 收件人
    // 手机号码
    // 区域
    // 详细地址
    // 邮编
    self.textfield1 = [[UITextField alloc]init];
    [self.view addSubview:self.textfield1];
    [self.textfield1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(KTopViewHeight);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    self.textfield1.placeholder = @"收件人";
    self.textfield1.font = [UIFont systemFontOfSize:15];
    UIView *lineView1 = [[UIView alloc]init];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.textfield1.mas_bottom).offset(0);
        make.height.mas_equalTo(.5);
    }];
    lineView1.backgroundColor = [UIColor lightGrayColor];
    
    self.textfield2 = [[UITextField alloc]init];
    [self.view addSubview:self.textfield2];
    [self.textfield2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView1.mas_bottom);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    self.textfield2 .placeholder = @"手机号码";
    self.textfield2 .font = [UIFont systemFontOfSize:15];
    
    UIView *lineView2 = [[UIView alloc]init];
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.textfield2 .mas_bottom).offset(0);
        make.height.mas_equalTo(.5);
    }];
    lineView2.backgroundColor = [UIColor lightGrayColor];
    
    self.textfield3 = [[UITextField alloc]init];
    [self.view addSubview:self.textfield3 ];
    [self.textfield3  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView2.mas_bottom);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    self.textfield3 .placeholder = @"所在区域";
    self.textfield3 .font = [UIFont systemFontOfSize:15];
 
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView2.mas_bottom);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    [button addTarget:self action:@selector(selectButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView3 = [[UIView alloc]init];
    [self.view addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.textfield3 .mas_bottom).offset(0);
        make.height.mas_equalTo(.5);
    }];
    lineView3.backgroundColor = [UIColor lightGrayColor];
    
    self.textfield4 = [[UITextField alloc]init];
    [self.view addSubview:self.textfield4];
    [self.textfield4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView3.mas_bottom);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    self.textfield4.placeholder = @"详细地址:如道路、门牌号、小区、楼栋号、单元室等";
    self.textfield4.font = [UIFont systemFontOfSize:15];
    UIView *lineView4 = [[UIView alloc]init];
    [self.view addSubview:lineView4];
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.textfield4.mas_bottom).offset(0);
        make.height.mas_equalTo(.5);
    }];
    lineView4.backgroundColor = [UIColor lightGrayColor];
    
    self.textfield5 = [[UITextField alloc]init];
    [self.view addSubview:self.textfield5];
    [self.textfield5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView4.mas_bottom);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    self.textfield5.placeholder = @"邮编";
    self.textfield5.font = [UIFont systemFontOfSize:15];
    UIView *lineView5 = [[UIView alloc]init];
    [self.view addSubview:lineView5];
    [lineView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.textfield5.mas_bottom).offset(0);
        make.height.mas_equalTo(.5);
    }];
    lineView5.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label6 = [[UILabel alloc]init];
    [self.view addSubview:label6];
    [label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView5.mas_bottom);
//        make.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    label6.font = [UIFont systemFontOfSize:15];
    label6.text = @"设为默认地址";
    
    self.switchView = [[UISwitch alloc]init];
    [self.view addSubview:self.switchView];
    [self.switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.mas_equalTo(-50);
        make.centerY.equalTo(label6.mas_centerY).offset(0);
    }];
    [self.switchView addTarget:self action:@selector(switchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView6 = [[UIView alloc]init];
    [self.view addSubview:lineView6];
    [lineView6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label6.mas_bottom).offset(0);
        make.height.mas_equalTo(.5);
    }];
    lineView6.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:deleteButton];
    [deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView6.mas_bottom);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(100);
    }];
    [deleteButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [deleteButton setTitle:@"删除收货地址" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [deleteButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    UIView *lineView7 = [[UIView alloc]init];
    [self.view addSubview:lineView7];
    [lineView7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(deleteButton.mas_bottom).offset(0);
        make.height.mas_equalTo(.5);
    }];
    lineView7.backgroundColor = [UIColor lightGrayColor];
    
    // UI 是否显示
    if (self.editType == oldEdit) {
        label6.hidden = NO;
        self.switchView.hidden = NO;
        lineView6.hidden = NO;
        deleteButton.hidden = NO;
        lineView7.hidden = NO;
    }else
    {
        label6.hidden = YES;
        self.switchView.hidden = YES;
        lineView6.hidden = YES;
        deleteButton.hidden = YES;
        lineView7.hidden = YES;
    }
    
    // 内容是否填充
    if (self.editType == oldEdit) {
        self.textfield1.text = self.model.consignee;
        self.textfield2.text = self.model.mobile;
        NSString *city = [self.model.city stringByReplacingOccurrencesOfString:@"/" withString:@" "];
        self.textfield3.text = city;
        self.textfield4.text = self.model.address;
        self.textfield5.text = self.model.zipcode;
        BOOL isdefalut = self.model.is_default;
        self.switchView.on = isdefalut;
    }
    
    // 默认地址
    self.switchView.enabled = !self.model.is_default;
    
}

#pragma mark  城市选择器
- (void)selectButtonAction
{
    [self.view addSubview:self.cityView];
    self.cityView.frame = self.view.bounds;
    
    __weak AddressEditNewViewController *weakSelf = self;
    
    weakSelf.cityView.getCity = ^(NSString * _Nonnull string) {
        NSLog(@"string  =%@",string);
        weakSelf.textfield3.text = string;
    };
}

#pragma mark  设置为默认地址
- (void)switchButtonAction:(UISwitch *)swtichView
{
    if (swtichView.on == YES) {
        NSLog(@"开关打开");
        [AddressDefaultNetworking postAddressDefaultWithToken:kUser.user_token withAddressID:self.model.ide completion:^(NSInteger code, NSError * _Nonnull error) {
            NSLog(@"code  =%ld",code);
            deCode = code;
            if (code == 0) {
                swtichView.on = NO;
            }
        }];
    }else
    {
        NSLog(@"开关关闭");
    }
}

#pragma mark 删除收货地址
- (void)deleteButtonAction
{
    NSLog(@"删除收货地址");
    [AddressDeleteNetworking postAddressDeleteWithToken:kUser.user_token withAddressID:self.model.ide completion:^(NSInteger code, NSError * _Nonnull error) {
        if (code == 1) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    
    
}

#pragma mark  提交地址
- (void)submitButtonAction
{
    if ([self.textfield1.text length] < 1)
    {
        [self showErrorMsg:@"收件人不能为空"];
        return;
    }
    
    if ([self.textfield2.text length] < 1)
    {
        [self showErrorMsg:@"手机号不能为空"];
        return;
    }
    if ([self.textfield3.text length] < 1)
    {
        [self showErrorMsg:@"所在区域不能为空"];
        return;
    }
    if ([self.textfield4.text length] < 1)
    {
        [self showErrorMsg:@"详细地址不能为空"];
        return;
    }
    if ([self.textfield5.text length] < 1)
    {
        [self showErrorMsg:@"邮编不能为空"];
        return;
    }
    if (self.editType == oldEdit) {
        //地址编辑
        [self addressEdit];
    }
    else
    {
        // 新增
      [self networking];
    }
    
}

//地址编辑
- (void)addressEdit
{
    [AddressEditNetworking postAddressEditWithToken:kUser.user_token withAddressID:self.model.ide withConsignee:self.textfield1.text withMobile:self.textfield2.text withCity:self.textfield3.text withAddress:self.textfield4.text withZipCode:self.textfield5.text completion:^(NSInteger code, NSError * _Nonnull error) {
        
        if (code == 1) {
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }];
}

// 新增
- (void)networking
{
    [AddressNewNetworking postAddressNewWithToken:kUser.user_token withConsignee:self.textfield1.text withMobile:self.textfield2.text withCity:self.textfield3.text withAddress:self.textfield4.text withZipCode:self.textfield5.text completion:^(NSInteger code, NSError * _Nonnull error) {
        if (code == 1) {
            // [self showSuccessMsg:@"新增成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            //[self showErrorMsg:@"新增失败,请重新编辑"];
        }
    }];
}

#pragma mark 懒加载
- (AddressSelectView *)cityView
{
    if (!_cityView) {
        _cityView = [[AddressSelectView alloc]init];
    }
    return _cityView;
}
@end

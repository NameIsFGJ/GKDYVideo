//
//  EditNickNameViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "EditNickNameViewController.h"
#import "EditProfileNetworking.h"
@interface EditNickNameViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)UILabel *countLabel;
@property (strong, nonatomic)UITextField *textfield;
@end

@implementation EditNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatNav];
    
    [self creatUI];
    
}
- (void)creatNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"昵称";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(saveInfo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveInfo
{
    [EditProfileNetworking postEditProfile:kUser.user_token withKey:@"nickname" WithValue:self.textfield.text completion:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
        if (model.code == 1) {
            [self showNormalMsg:@"保存成功"];
            [self pushViewController];
        }else{
            [self showErrorMsg:@"修改失败q,请重新修改"];
        }
    }];
}

- (void)creatUI
{
    self.textfield = [[UITextField alloc]init];
    [self.view addSubview:self.textfield];
    self.textfield.delegate = self;
    [self.textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(35);
    }];
    
    self.textfield.textColor = [UIColor lightGrayColor];
    self.textfield.font = kFontSize(15);
    self.textfield.placeholder = @"填写您的昵称";
   
    
    UIView *lineView = [[UIView alloc]init];
    [self.view addSubview:lineView];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self.textfield.mas_bottom).offset(0);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(.5);
    }];
    
    self.countLabel = [[UILabel alloc]init];
    self.countLabel.textColor = [UIColor lightGrayColor];
    self.countLabel.font = kFontSize(12);
    [self.view addSubview:self.countLabel];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(lineView.mas_bottom).offset(4);
    }];
    
    self.countLabel.text = @"0/10";

    [self.textfield.rac_textSignal subscribeNext:^(NSString * x) {
    
        self.countLabel.text = [NSString stringWithFormat:@"%ld/10",[x length]];
        
        
    } completed:^{
        
    }];
    
}

//return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    NSString *toString = [textField.text stringByReplacingCharactersInRange:range withString:string];

    if ([textField.text length]> 9) {

        textField.text = [toString substringToIndex:9];
    }

    return YES;
}

@end

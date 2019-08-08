//
//  EditSignsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "EditSignsViewController.h"
#import "EditProfileNetworking.h"

@interface EditSignsViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)UILabel *countLabel;
@property (strong, nonatomic)UITextField *textfield;
@end

@implementation EditSignsViewController

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
    label.text = @"签名";
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
    
    [EditProfileNetworking postEditProfile:kUser.user_token withKey:@"signs" WithValue:self.textfield.text completion:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
        NSLog(@"model.code  =%ld",model.code);
        if (model.code == 1) {
            [self showNormalMsg:@"保存成功"];
            [self pushViewController];
        }else{
            [self showErrorMsg:@"修改出错"];
            //  [self showErrorMsg:model.msg];
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
    self.textfield.placeholder = @"填写您的个人签名";
    
    UIView *lineView = [[UIView alloc]init];
    [self.view addSubview:lineView];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self.textfield.mas_bottom).offset(0);
        make.right.mas_equalTo(10);
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
    
    self.countLabel.text = @"0/40";
    
    [self.textfield.rac_textSignal subscribeNext:^(NSString * x) {
        
        self.countLabel.text = [NSString stringWithFormat:@"%ld/40",[x length]];
        
    } completed:^{
    }];
}

//return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    NSString *toString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([textField.text length]> 39) {
        
        textField.text = [toString substringToIndex:39];
    }
    
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

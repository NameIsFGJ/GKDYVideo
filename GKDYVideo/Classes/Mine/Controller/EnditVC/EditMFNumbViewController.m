//
//  EditMFNumbViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "EditMFNumbViewController.h"
#import "EditProfileNetworking.h"


@interface EditMFNumbViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)UILabel *countLabel;
@property (strong, nonatomic)UITextField *textfield;

@end

@implementation EditMFNumbViewController

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
    label.text = @"漫饭号";
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
    
    BOOL isLegal = false;
    if ([self.textfield.text length] >16 ||[self.textfield.text length] < 6) {
        [self showNormalMsg:@"请重新输入漫饭号"];
        return;
    }
    
    for (int i = 0; i <[self.textfield.text length]; i ++) {
        
        int asciiCode = [self.textfield.text characterAtIndex:i];
        
        // 数字 小写。大
        if ((asciiCode >47)&& (asciiCode <58)) {
            isLegal = YES;
        }else if ((asciiCode > 96) && (asciiCode < 123))
        {
            isLegal = YES;
        }else if ((asciiCode >64) && (asciiCode < 91))
        {
            isLegal = YES;
        }else{
            isLegal = NO;
        }
    }
    
    NSString *string = isLegal? @"0":@"1";
    if ([string isEqualToString:@"1"]) {
        [self showErrorMsg:@"只能输入小写字母,大写字母以及数字"];
        return;
    }
    
    [EditProfileNetworking postEditProfile:kUser.user_token withKey:@"mf_num" WithValue:self.textfield.text completion:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
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
    self.textfield.placeholder = @"修改您的漫饭号";
    
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
    
    self.countLabel.text = @"6~16位数,只允许包括字母、数字,且只可修改一次";
    
    [self.textfield.rac_textSignal subscribeNext:^(NSString * x) {
        
        //self.countLabel.text = [NSString stringWithFormat:@"%ld/10",[x length]];
        
         } completed:^{
    }];
}

//return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    NSString *toString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([textField.text length]> 15) {
        
        textField.text = [toString substringToIndex:15];
    }
    
    return YES;
}
@end

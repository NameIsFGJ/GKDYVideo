//
//  IDCardViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "IDCardViewController.h"
#import "IdCardUploadNetworking.h"
@interface IDCardViewController ()<TZImagePickerControllerDelegate>
@property (strong, nonatomic)UIButton *IDCardButton1;
@property (strong, nonatomic)UIButton *IDCardButton2;
@property (strong, nonatomic)UITextField *nameTextField;
@property (strong, nonatomic)UITextField *idCardTextField;
@property (strong, nonatomic)UIButton *submitButton;
@property (strong, nonatomic)TZImagePickerController *pickerVC1;
@property (strong, nonatomic)TZImagePickerController *pickerVC2;
@end

@implementation IDCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      self.view.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
    
    [self makeNav];
    [self makeUI];
    
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"实名认证";
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
    UIView *view1 = [[UIView alloc]init];
    [self.view addSubview:view1];
    view1.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(168);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    
    [view1 addSubview:self.IDCardButton1];
    [view1 addSubview:self.IDCardButton2];
    NSArray *array1 = [NSArray arrayWithObjects:self.IDCardButton1,self.IDCardButton2, nil];
    [array1 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:21 leadSpacing:12 tailSpacing:12];
    [array1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view1.mas_centerY).offset(0);
    }];
    [array1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(24);
        make.bottom.mas_equalTo(-24);
    }];
    UILabel *label1 = [[UILabel alloc]init];
    [self.view addSubview:label1];
    label1.font = kFontSize(14);
    label1.text = @"请填写真实姓名与身份证以便审核";
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(view1.mas_bottom);

    }];
    
    UIView *view2 = [[UIView alloc]init];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label1.mas_bottom).offset(10);
        make.height.mas_equalTo(100);
    }];
 
    UIView *view22 = [[UIView alloc]init];
    [view2 addSubview:view22];
    view22.backgroundColor = [UIColor whiteColor];
    [view22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.equalTo(view2.mas_height).multipliedBy(.5);
    }];

    UILabel *label22 = [[UILabel alloc]init];
    [view22 addSubview:label22];
    label22.text = @"姓名";
    label22.font = kFontSize(15);
    label22.textColor = [UIColor blackColor];
    [label22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(.5);
        make.width.mas_equalTo(80);
    }];
    
    self.nameTextField = [[UITextField alloc]init];
    [view22 addSubview:self.nameTextField];
    self.nameTextField.placeholder = @"本人姓名";
    self.nameTextField.font = kFontSize(15);
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label22.mas_right).offset(10);
        make.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(.5);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    [view22 addSubview:lineView];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(.5);
    }];
    
    UIView *view23 = [[UIView alloc]init];
    [view2 addSubview:view23];
    view23.backgroundColor = [UIColor whiteColor];
    [view23 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.right.bottom.mas_equalTo(0);
         make.height.equalTo(view2.mas_height).multipliedBy(.5);
    }];
    
    UILabel *label23 = [[UILabel alloc]init];
    [view23 addSubview:label23];
    label23.text = @"身份证";
    label23.font = kFontSize(15);
    label23.textColor = [UIColor blackColor];
    [label23 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(.5);
        make.width.mas_equalTo(80);
    }];
    
    self.idCardTextField = [[UITextField alloc]init];
    [view23 addSubview:self.idCardTextField];
    self.idCardTextField.placeholder = @"本人身份证";
    self.idCardTextField.font = kFontSize(15);
    
    [self.idCardTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label22.mas_right).offset(10);
        make.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(.5);
    }];
    
    [self.view addSubview:self.submitButton];
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(view2.mas_bottom).offset(30);
        make.height.mas_equalTo(50);
        make.right.mas_equalTo(-12);
    }];
}

- (void)pushPhotoAction:(UIButton *)btn
{
    if (btn.tag == 201) {
        self.pickerVC1 = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
        // 允许选择图片
        self.pickerVC1.allowPickingImage = YES;
        [self presentViewController:self.pickerVC1 animated:YES completion:^{
            
        }];
    }else if (btn.tag == 202){
        self.pickerVC2 = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
        // 允许选择图片
        self.pickerVC2.allowPickingImage = YES;
        [self presentViewController:self.pickerVC2 animated:YES completion:^{
            
        }];
    }
}
- (void)submitButtonAction
{
    [IdCardUploadNetworking postIdCardUpLoad:kUser.user_token withTrueName:self.nameTextField.text withIDCard:[self.idCardTextField.text integerValue] withPic:self.IDCardButton1.imageView.image withPicUn:self.IDCardButton2.imageView.image completion:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
        
    }];
}
#pragma mark TZImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto;
{
    if (picker == self.pickerVC1) {
         UIImage *image = [photos firstObject];
        [self.IDCardButton1 setImage:image forState:UIControlStateNormal];
     
    }else if (picker == self.pickerVC2){
        UIImage *image = [photos firstObject];
        [self.IDCardButton2 setImage:image forState:UIControlStateNormal];
    }
}

#pragma mark 懒加载
- (UIButton *)IDCardButton1
{
    if (!_IDCardButton1) {
        _IDCardButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _IDCardButton1.tag = 201;
        [_IDCardButton1 setImage:[UIImage imageNamed:@"IDCard1"] forState:UIControlStateNormal];
        [_IDCardButton1 addTarget:self action:@selector(pushPhotoAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _IDCardButton1;
}

- (UIButton *)IDCardButton2
{
    if (!_IDCardButton2) {
        _IDCardButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
         _IDCardButton2.tag = 202;
        [_IDCardButton2 setImage:[UIImage imageNamed:@"IDCard2"] forState:UIControlStateNormal];
        [_IDCardButton2 addTarget:self action:@selector(pushPhotoAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _IDCardButton2;
}

- (UIButton *)submitButton
{
    if (!_submitButton) {
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitButton setBackgroundColor:[UIColor colorWithHex:@"#FF9000"]];
        [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitButton setTitle:@"提交审核" forState:UIControlStateNormal];
        [_submitButton.titleLabel setFont:kFontSize(15)];
        _submitButton.layer.cornerRadius = 5;
        _submitButton.layer.masksToBounds = YES;
        [_submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}
@end

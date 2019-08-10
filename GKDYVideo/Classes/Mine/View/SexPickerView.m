//
//  SexPickerView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SexPickerView.h"
#import "EditProfileNetworking.h"
@interface SexPickerView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic)UIPickerView *pickerView;
@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) NSMutableArray *itemsArray;
@property (strong,nonatomic) UIButton *submitButton;
@property (strong, nonatomic) NSString *currentSex;
@end

@implementation SexPickerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self makeUI];
    }
    return self;
}

- (void)makeUI
{
    UIView *blackView = [[UIView alloc]init];
    [self addSubview:blackView];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(kWindowHeight - 330);
    }];
    blackView.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(missView)];
    [blackView addGestureRecognizer:tap];
    
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(blackView.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [self addSubview:self.pickerView];
    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        // make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(300);
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.topView.mas_bottom).offset(0);
    }];
    self.pickerView.backgroundColor = [UIColor whiteColor];
    
    self.currentSex = @"男";
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.itemsArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   
    return self.itemsArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.currentSex = self.itemsArray[row];
}

#pragma mark 懒加载
- (UIPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc]init];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray arrayWithObjects:@"男",@"女", nil];
    }
    return _itemsArray;
}

- (UIView *)topView
{
    if (!_topView) {
        _topView = [[UIView alloc]init];
        _topView.backgroundColor = [UIColor whiteColor];
        _topView.userInteractionEnabled = YES;
        UILabel *titleLabel = [[UILabel alloc]init];
        [_topView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_topView.mas_centerX).offset(0);
            make.top.mas_equalTo(5);
        }];
        titleLabel.text = @"出生年月";
        [_topView addSubview:self.submitButton];
        [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_topView.mas_right).offset(-20);
            make.size.mas_equalTo(CGSizeMake(40, 30));
        }];
    }
    return _topView;
}

- (void)buttonAcion
{
    [EditProfileNetworking postEditProfile:kUser.user_token withKey:@"sex" WithValue:self.currentSex completion:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
        if (model.code == 1) {
            [self showSuccessMsg:@"修改成功"];
        }
        [self missView];
    }];
}

- (void)missView
{
    [UIView animateWithDuration:.5 animations:^{
        [self removeFromSuperview];
        self.block();
    }];
}

- (UIButton *)submitButton
{
    if (!_submitButton) {
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitButton setTitle:@"确定" forState:UIControlStateNormal];
        [_submitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(buttonAcion) forControlEvents:UIControlEventTouchUpInside];
        _submitButton.layer.cornerRadius = 5;
        _submitButton.layer.masksToBounds = YES;
        _submitButton.layer.borderWidth = .5;
        _submitButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _submitButton;
}
@end

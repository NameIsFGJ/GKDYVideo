//
//  BirthPickerView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BirthPickerView.h"
#import "EditProfileNetworking.h"
@interface BirthPickerView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic)UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *yearArray;
@property (nonatomic, strong) NSMutableArray *monthArray;
@property (nonatomic, strong) NSMutableArray *dayArray;
@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) NSString *currentYear;
@property (strong, nonatomic) NSString *currentMonth;
@property (strong, nonatomic) NSString *currentDay;
@property (strong,nonatomic) UIButton *submitButton;
@end

@implementation BirthPickerView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        [self makeUI];
        [self networking];
    }
    return self;
}

#pragma mark Action

-(void)makeUI
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
    
}

- (void)networking
{
    for (int i = 1940; i< 2020; i ++) {
        
        [self.yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    for (int i = 1; i < 13; i ++) {
        [self.monthArray addObject:[NSString stringWithFormat:@"%.2d",i]];
    }
   
    for (int i = 1; i < 32; i ++) {
        [self.dayArray addObject:[NSString stringWithFormat:@"%.2d",i]];
    }
}

#pragma mark UIPickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//    return 5;
    if (component == 0) {
        return self.yearArray.count;
    }else if (component == 1){
        return self.monthArray.count;
    }else if (component == 2){
        return self.dayArray.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.yearArray[row];
    }else if (component == 1){
        return self.monthArray[row];
    }else if (component == 2){
        return self.dayArray[row];
    }
    return @"2";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        self.currentYear = self.yearArray[row];
    }else if (component == 1){
        self.currentMonth = self.monthArray[row];
    }else if (component == 2){
        self.currentDay = self.dayArray[row];
    }
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

- (NSMutableArray *)yearArray {
    if (!_yearArray) {
        _yearArray = [NSMutableArray array];
    }
    return _yearArray;
}

- (NSMutableArray *)monthArray {
    if (!_monthArray) {
        _monthArray = [NSMutableArray array];
    }
    return _monthArray;
}

- (NSMutableArray *)dayArray {
    if (!_dayArray) {
        _dayArray = [NSMutableArray array];
    }
    return _dayArray;
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

    NSString *birthday = [NSString stringWithFormat:@"%@-%@-%@",self.currentYear,self.currentMonth,self.currentDay];
    [EditProfileNetworking postEditProfile:kUser.user_token withKey:@"birthday" WithValue:birthday completion:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
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
@end

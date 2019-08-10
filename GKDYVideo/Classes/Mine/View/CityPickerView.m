//
//  CityPickerView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "CityPickerView.h"
#import "EditProfileNetworking.h"
#import "ProvinceModel.h"
@interface CityPickerView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic)UIPickerView *pickerView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (strong, nonatomic) UIView *topView;
@property (strong,nonatomic) UIButton *submitButton;
// 省
@property (nonatomic, strong) NSMutableArray *provinceArr;
// 市
@property (nonatomic, strong) NSMutableArray *cityArr;
// 区
@property (nonatomic, strong) NSMutableArray *areaArr;

@property (strong, nonatomic) NSMutableArray *currentArray;

// 当前 省份
@property (strong, nonatomic) NSString *currentProvince;

// 当前 市
@property (strong, nonatomic) NSString *currentCity;

// 当前 区
@property (strong, nonatomic) NSString *currentArea;
@end

@implementation CityPickerView

- (instancetype)init
{
    self = [super init];
    
    
    
    [self makeUI];
    
    [self networking];
    
    
    return self;
}
#pragma mark Action
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
}

- (void)networking
{
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    for (NSDictionary *dic in dataArray) {
        ProvinceModel *model = [ProvinceModel yy_modelWithDictionary:dic];
        [self.itemsArray addObject:model];
    }
    
    [self cityAreaArray];
    
}

- (void)cityAreaArray
{
    [self.provinceArr removeAllObjects];
    [self.cityArr removeAllObjects];
    [self.areaArr removeAllObjects];
    if (!self.currentProvince) {
        self.currentProvince = ((ProvinceModel *)self.itemsArray[0]).name;
    }
    
    for (ProvinceModel *proModel in self.itemsArray) {
        [self.provinceArr addObject:proModel.name];
        if ([self.currentProvince isEqualToString:proModel.name]) {
            if (!self.currentCity) {
                NSDictionary *dic = proModel.city[0];
                self.currentCity = [dic objectForKey:@"name"];
            }
            for (NSDictionary *dic in proModel.city) {
                [self.cityArr addObject:[dic objectForKey:@"name"]];
            }
            self.areaArr = [proModel.city[0] objectForKey:@"area"];
            self.currentArea = self.areaArr[0];
        }
    }
}

- (void)buttonAcion
{
    NSString *city = [NSString stringWithFormat:@"%@/%@/%@",self.currentProvince,self.currentCity,self.currentArea];
    [EditProfileNetworking postEditProfile:kUser.user_token withKey:@"city" WithValue:city completion:^(NewBaseModel * _Nonnull model, NSError * _Nonnull error) {
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
    }];
     self.block();
}

#pragma mark UIPickerViewDelegate
// 几行
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return  3;
}

// 一行有几列
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if (component == 0) {
        return self.provinceArr.count;
    }else if (component == 1){
        return self.cityArr.count;
    }else if (component == 2){
        return self.areaArr.count;
    }
    return 1;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.provinceArr[row];
    }else if (component == 1){
        return self.cityArr[row];
    }else if (component == 2){
           return self.areaArr[row];
    }
    return @"s";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [self.cityArr removeAllObjects];
        self.currentProvince = self.provinceArr[row];
        NSLog(@"self.currentProvince =%@",self.currentProvince);
        for (ProvinceModel *model in self.itemsArray) {
            if ([model.name isEqualToString:self.currentProvince]) {
              
                for (NSDictionary *dic in model.city) {
                    NSString *name = [dic objectForKey:@"name"];
                    [self.cityArr addObject:name];
                }
                NSDictionary *dic = model.city[0];
                self.currentCity = [dic objectForKey:@"name"];
                self.areaArr = [model.city[0] objectForKey:@"area"];
                self.currentArea = self.areaArr[0];
                [pickerView selectRow:0 inComponent:1 animated:YES];
                [pickerView selectRow:0 inComponent:2 animated:YES];
                [pickerView reloadAllComponents];
            }
        }
        
    }else if (component == 1){
        
        self.currentCity = self.cityArr[row];
       
        for (ProvinceModel *model in self.itemsArray) {
            if ([model.name isEqualToString:self.currentProvince]) {
                
                for (NSDictionary *dic in model.city) {
                    NSString *name = [dic objectForKey:@"name"];
                    if ([self.currentCity isEqualToString:name]) {
                        self.areaArr = [dic objectForKey:@"area"];
                    }
                }
                
                self.currentArea = [self.areaArr firstObject];
                
                
                NSLog(@"1currentProvince =%@,currentCity =%@,currentArea =%@",self.currentProvince,self.currentCity,self.currentArea);
                
                [pickerView selectRow:0 inComponent:2 animated:YES];
                [pickerView reloadAllComponents];
            }
        }
    }else if (component == 2)
    {
        self.currentArea = self.areaArr[row];
        NSLog(@"2currentProvince =%@,currentCity =%@,currentArea =%@",self.currentProvince,self.currentCity,self.currentArea);
        
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

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}


- (NSMutableArray *)provinceArr {
    if (!_provinceArr) {
        _provinceArr = [NSMutableArray array];
    }
    return _provinceArr;
}

- (NSMutableArray *)cityArr {
    if (!_cityArr) {
        _cityArr = [NSMutableArray array];
    }
    return _cityArr;
}

- (NSMutableArray *)areaArr {
    if (!_areaArr) {
        _areaArr = [NSMutableArray array];
    }
    return _areaArr;
}

- (NSMutableArray *)currentArray
{
    if (!_currentArray) {
        _currentArray = [NSMutableArray array];
    }
    return _currentArray;
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
        titleLabel.text = @"地区选择";
        [_topView addSubview:self.submitButton];
        [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_topView.mas_right).offset(-20);
            make.size.mas_equalTo(CGSizeMake(40, 30));
        }];
    }
    return _topView;
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

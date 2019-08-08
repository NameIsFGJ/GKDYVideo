//
//  CityPickerView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "CityPickerView.h"

@interface CityPickerView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic)UIPickerView *pickView;
@property (strong, nonatomic)NSArray *itemsArray;

@end

@implementation CityPickerView

- (instancetype)init
{
    self = [super init];
    
    [self addSubview:self.pickView];
    
   // [self networking];
    
    
    return self;
}

#pragma mar
// 几行
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return self.itemsArray.count;
}

// 一行有几列
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return self.itemsArray.count;
}


- (UIPickerView *)pickView
{
    if (!_pickView) {
        _pickView = [[UIPickerView alloc]init];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        
    }
    return _pickView;
}
@end

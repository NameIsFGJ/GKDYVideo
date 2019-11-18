//
//  IdearViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "IdearViewController.h"

@interface IdearViewController ()<UITextViewDelegate>
@property (strong, nonatomic) UILabel *label;

@end

@implementation IdearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"意见反馈";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)makeUI
{
        UIView *lineView1 = [[UIView alloc]init];
        [self.view addSubview:lineView1];
        [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(KTopViewHeight);
            make.height.mas_equalTo(.3);
        }];
        lineView1.backgroundColor = [UIColor lightGrayColor];
  
    UIView *contentView = [[UIView alloc]init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    contentView.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1];
    
    UITextView *textView = [[UITextView alloc]init];
    [contentView addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(contentView.mas_top).offset(8);
        make.height.mas_equalTo(230);
    }];
    textView.textColor = [UIColor lightGrayColor];
    //textView.textColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:14];
    textView.text = @"请填写10个字以上的问题描述,以便我们为你提供更好的帮助,我们将感激不尽!";
    
    self.label = [[UILabel alloc]init];
    [contentView addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(textView.mas_bottom).offset(-20);
        make.height.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    self.label.textColor = kPickColor;
    self.label.textAlignment = NSTextAlignmentRight;
    self.label.text = @"0/200      ";
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:submitButton];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(textView.mas_bottom).offset(30);
        make.height.mas_equalTo(50);
    }];
    submitButton.layer.cornerRadius = 25;
    submitButton.layer.masksToBounds = YES;
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitButton setBackgroundColor:kPickColor];
    submitButton.titleLabel.font = [UIFont systemFontOfSize:16];
    
}
- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
{
    textView.text = @"";
    textView.textColor = [UIColor blackColor];
    
    [[textView rac_textSignal] subscribeNext:^(NSString * string) {
        // NSLog(@"%@",string);
        NSInteger lenght = [string length];
       
        self.label.text = [NSString stringWithFormat:@"%ld/200",lenght];
    }];
    return YES;
}

@end

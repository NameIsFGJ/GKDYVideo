//
//  NewWaitSendBackPayViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewWaitSendBackPayViewController.h"
#import "NewWaitPayReasonView.h"
#import "NewWaitPaySendBackPayDetailViewController.h"
@interface NewWaitSendBackPayViewController ()<TZImagePickerControllerDelegate>
@property (strong, nonatomic) NewWaitPayReasonView *reasonView;
@property (strong, nonatomic) UIButton *firstButton;
@property (strong, nonatomic) UIButton *secondButton;
@property (strong, nonatomic) UIButton *thirdButton;
@property (strong, nonatomic) NSMutableArray *buttonArray;
@property (strong, nonatomic) NSArray *itemsArray;
@property (strong, nonatomic) UIButton *selectPhotoButton;
@property (strong, nonatomic) UIView *view4;

@end

@implementation NewWaitSendBackPayViewController

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
    label.text = @"订单详情";
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
    UIView *contentView = [[UIView alloc]init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kWindowHeight - KTopViewHeight-88);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    contentView.backgroundColor = kBgColor;
    
    //----------------------------view0-------------------------
    
    UIView *view0 = [[UIView alloc]init];
    [contentView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(1);
        make.height.mas_equalTo(100);
    }];
    view0.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView0 = [[UIImageView alloc]init];
    [view0 addSubview:imageView0];
    [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(view0.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    imageView0.layer.borderWidth = .3;
    imageView0.layer.borderColor = kBgColor.CGColor;
    imageView0.backgroundColor = [UIColor blueColor];
    
    UILabel *label0 = [[UILabel alloc]init];
    [view0 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.equalTo(imageView0.mas_top);
        make.width.mas_equalTo(80);
    }];
    label0.text = @"¥420";
    label0.textAlignment =   NSTextAlignmentRight;
    label0.textColor = [UIColor blackColor];
    label0.font = [UIFont systemFontOfSize:15];
    
    UILabel *label01 = [[UILabel alloc]init];
    [view0 addSubview:label01];
    [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.equalTo(label0.mas_bottom).offset(5);
        make.width.mas_equalTo(80);
    }];
    label01.text = @"x1";
    label01.textColor = [UIColor lightGrayColor];
    label01.font = [UIFont systemFontOfSize:15];
    label01.textAlignment =   NSTextAlignmentRight;
    
    UILabel *label02 = [[UILabel alloc]init];
    [view0 addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView0.mas_right).offset(10);
        make.top.equalTo(imageView0.mas_top).offset(0);
        make.right.equalTo(label0.mas_left).offset(10);
    }];
    label02.text = @"罗衣轻奢系列48支双股100%绵羊毛毛衣女秋冬新款打底针织衫";
    label02.textColor = [UIColor blackColor];
    label02.font = [UIFont systemFontOfSize:15];
    label02.numberOfLines = 0;
    
    UILabel *label03 = [[UILabel alloc]init];
    [view0 addSubview:label03];
    [label03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label02.mas_left).offset(0);
        make.right.equalTo(label0.mas_left).offset(10);
        make.bottom.equalTo(imageView0.mas_bottom).offset(0);
    }];
    label03.text = @"标准套装+红色";
    label03.textColor = [UIColor lightGrayColor];
    label03.font = [UIFont systemFontOfSize:15];
    
    //----------------------------view1-------------------------
    
    UIView *view1 = [[UIView alloc]init];
    [contentView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom).offset(9);
        make.height.mas_equalTo(48);
    }];
    view1.backgroundColor = [UIColor whiteColor];
    UILabel *label11 = [[UILabel alloc]init];
    [view1 addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view1);
    }];
    label11.text = @"退款原因";
    label11.font = [UIFont systemFontOfSize:15];
    label11.textColor = [UIColor blackColor];
 
    UILabel *label12 = [[UILabel alloc]init];
    [view1 addSubview:label12];
    [label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(view1);
       // make.size
    }];
    label12.text = @">";
    label12.font = [UIFont systemFontOfSize:15];
    label12.textColor = [UIColor blackColor];
    label12.textAlignment = NSTextAlignmentRight;
    
    UILabel *label13 = [[UILabel alloc]init];
    [view1 addSubview:label13];
    [label13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label11.mas_right).offset(40);
        make.centerY.equalTo(view1);
    }];
    label13.text = @"多拍";
    label13.font = [UIFont systemFontOfSize:15];
    label13.textColor = [UIColor blackColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapButtonAction)];
    [view1 addGestureRecognizer:tap];
    
     // 隐藏视图
    
    self.reasonView = [[NewWaitPayReasonView alloc]init];
    [self.view addSubview:self.reasonView];
    self.reasonView.frame = self.view.bounds;
    self.reasonView.hidden = YES;
    
    //----------------------------view2-------------------------
    UIView *view2 = [[UIView alloc]init];
    [contentView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom).offset(1);
        make.height.mas_equalTo(48);
    }];
    view2.backgroundColor = [UIColor whiteColor];
    UILabel *label21 = [[UILabel alloc]init];
    [view2 addSubview:label21];
    [label21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view2);
    }];
    label21.text = @"退款金额";
    label21.font = [UIFont systemFontOfSize:15];
    label21.textColor = [UIColor blackColor];
    
    UILabel *label22 = [[UILabel alloc]init];
    [view2 addSubview:label22];
    [label22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label21.mas_right).offset(40);
        make.centerY.equalTo(view2);
        
    }];
    label22.text =@"¥420";
    label22.font = [UIFont systemFontOfSize:15];
    label22.textColor = [UIColor blackColor];
    label22.textAlignment = NSTextAlignmentRight;
    
    //----------------------------view3-------------------------
    UIView *view3 = [[UIView alloc]init];
    [contentView addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view2.mas_bottom).offset(1);
        make.height.mas_equalTo(48);
    }];
    view3.backgroundColor = [UIColor whiteColor];
    UILabel *label31 = [[UILabel alloc]init];
    [view3 addSubview:label31];
    [label31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view3);
    }];
    label31.text = @"退款说明";
    label31.font = [UIFont systemFontOfSize:15];
    label31.textColor = [UIColor blackColor];
    
    UITextField *textField32 = [[UITextField alloc]init];
    [view3 addSubview:textField32];
    [textField32 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label21.mas_right).offset(40);
        make.centerY.equalTo(view3);
        
    }];
    textField32.placeholder = @"选填";
    textField32.font = [UIFont systemFontOfSize:15];
    textField32.textColor = [UIColor blackColor];
    //textField32.textAlignment = NSTextAlignmentRight;
    
    UILabel *label9 = [[UILabel alloc]init];
    [contentView addSubview:label9];
    [label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(view3.mas_bottom);
        make.height.mas_equalTo(34);
    }];
    label9.text = @"上传凭证(最多三张图片)";
    label9.font = [UIFont systemFontOfSize:12];
    label9.textColor = [UIColor colorWithHex:@"#AAAAAA"];
    
    self.view4 = [[UIView alloc]init];
    [contentView addSubview:self.view4];
    [self.view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label9.mas_bottom);
        make.height.mas_equalTo(113);
    }];
    self.view4.backgroundColor = [UIColor whiteColor];
    self.selectPhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view4 addSubview:self.selectPhotoButton];
    [self.selectPhotoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.view4.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(86, 86));
    }];
    [self.selectPhotoButton setImage:[UIImage imageNamed:@"photo_pc"] forState:UIControlStateNormal];
    [self.selectPhotoButton addTarget:self action:@selector(selectButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:submitButton];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.bottom.mas_equalTo(0);
       // make.top.equalTo(view4.mas_bottom).offset(10);
    }];
    [submitButton setBackgroundColor:kPickColor];
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)tapButtonAction
{
    self.reasonView.hidden = !self.reasonView.hidden;
}

- (void)submitButtonAction
{
    NewWaitPaySendBackPayDetailViewController *vc = [[NewWaitPaySendBackPayDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

// 点击照片方法
- (void)selectButtonAction
{
    TZImagePickerController *pickerVC = [[TZImagePickerController alloc]initWithMaxImagesCount:3 delegate:self];
    // 允许选择图片
    pickerVC.allowPickingImage = YES;
    [self presentViewController:pickerVC animated:YES completion:^{
        
    }];
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto;
{
    self.itemsArray = nil;
    self.itemsArray = photos;
}

- (void)setItemsArray:(NSArray *)itemsArray
{
    _itemsArray = itemsArray;
    
    for (UIButton *btn in [self.view4 subviews]) {
        [btn removeFromSuperview];
    }
    
    if (itemsArray.count <= 3) {
        for (int i = 0; i < itemsArray.count; i++)
        {
            UIButton *btn = self.buttonArray[i];
            [self.view4 addSubview:btn];
            btn.tag = 200+i;
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(10+ 95*i);
                make.size.mas_equalTo(CGSizeMake(85, 85));
                make.centerY.equalTo(self.view4.mas_centerY);
            }];
            [btn setImage:self.itemsArray[i]  forState:UIControlStateNormal];
            
            if (itemsArray.count - i == 1)
            {
                [self.view4 addSubview:self.selectPhotoButton];
                
                [self.selectPhotoButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                   // make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                    make.left.equalTo(btn.mas_right).offset(10);
                    make.size.mas_equalTo(CGSizeMake(85, 85));
                    make.centerY.equalTo(self.view4.mas_centerY);
                }];
            }
     }
   }
}

#pragma mark lazyLoad

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray arrayWithObjects:self.firstButton,self.secondButton,self.thirdButton, nil];
    }
    return _buttonArray;
}

- (UIButton *)firstButton
{
    if (!_firstButton) {
        _firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _firstButton;
}

- (UIButton *)secondButton
{
    if (!_secondButton) {
        _secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _secondButton;
}

- (UIButton *)thirdButton
{
    if (!_thirdButton) {
        _thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _thirdButton;
}
@end

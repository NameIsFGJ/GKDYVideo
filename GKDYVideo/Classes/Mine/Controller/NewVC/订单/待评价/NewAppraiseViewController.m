//
//  NewAppraiseViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewAppraiseViewController.h"
#import "NewAppraiseSuccessViewController.h"

@interface NewAppraiseViewController ()
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (weak, nonatomic) IBOutlet UIButton *bestButton;
@property (weak, nonatomic) IBOutlet UIButton *worstButton;
@property (weak, nonatomic) IBOutlet UIButton *middleButton;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel1;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel2;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel3;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *noneNameButton;

@property (assign, nonatomic) int buttonTag;
@property (assign, nonatomic) int buttonSelectIndex;

@end

@implementation NewAppraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kWhiteColor;
    
    [self makeNav];
    
    [self makeUI];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"评价";
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
    [self.bestButton setImage:[UIImage imageNamed:@"好评2"] forState:UIControlStateNormal];
    
    [self.bestButton setImage:[UIImage imageNamed:@"好评"] forState:UIControlStateSelected];
    
    [self.middleButton setImage:[UIImage imageNamed:@"差评"] forState:UIControlStateNormal];
    
    [self.middleButton setImage:[UIImage imageNamed:@"差"] forState:UIControlStateSelected];
    
    [self.worstButton setImage:[UIImage imageNamed:@"差评"] forState:UIControlStateNormal];
    
    [self.worstButton setImage:[UIImage imageNamed:@"差"] forState:UIControlStateSelected];
    
    for (NSInteger i = 101; i <= 105; i ++) {
        UIButton *btn = [self.view viewWithTag:i];
        [btn setImage:[UIImage imageNamed:@"starNor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"starSel"] forState:UIControlStateSelected];
    }
    for (NSInteger i = 201; i <= 205; i ++) {
        UIButton *btn = [self.view viewWithTag:i];
        [btn setImage:[UIImage imageNamed:@"starNor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"starSel"] forState:UIControlStateSelected];
    }
    for (NSInteger i = 301; i <= 305; i ++) {
        UIButton *btn = [self.view viewWithTag:i];
        [btn setImage:[UIImage imageNamed:@"starNor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"starSel"] forState:UIControlStateSelected];
    }
    
    [self.noneNameButton setImage:[UIImage imageNamed:@"tickNor"] forState:UIControlStateNormal];

    [self.noneNameButton setImage:[UIImage imageNamed:@"tickSel"] forState:UIControlStateSelected];
    
    self.submitButton.layer.cornerRadius = 15;
    
    self.submitButton.layer.masksToBounds = YES;
    
    self.buttonSelectIndex = -1;
    self.buttonTag = -400;
}
- (IBAction)commentButtonAction:(UIButton *)sender
{
    if ((self.buttonTag != sender.tag ) && (self.buttonTag != -400)){
        
        UIButton *btn = [self.view viewWithTag:self.buttonTag];
         btn.selected = NO;
    }
    
    if (sender.selected == NO)
    {
        self.buttonSelectIndex = (int)sender.tag - 400;
        sender.selected = YES;
        self.buttonTag = (int)sender.tag;
        
    }
    else
    {
        self.buttonSelectIndex = -1;
        sender.selected = NO;
       
    }
    
}

// 上传照片
- (IBAction)photoButtonAction:(UIButton *)sender {
}
// 上传视频
- (IBAction)videoButtonAction:(UIButton *)sender {
}

// 描述相符
- (IBAction)button1Action:(UIButton *)sender {
    
    NSInteger index = sender.tag;
    for (NSInteger i = 100; i <= index; i ++) {
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = YES;
    }
    
    for (NSInteger i = index+1 ; i <= 105; i ++) {
       
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = NO;
    }
    
    switch (index) {
        case 101:
            self.commentLabel1.text = @"非常差";
            break;
        case 102:
            self.commentLabel1.text = @"差";
            break;
        case 103:
            self.commentLabel1.text = @"一般";
            break;
        case 104:
            self.commentLabel1.text = @"好";
            break;
        case 105:
            self.commentLabel1.text = @"非常好";
            break;
        default:
            break;
    }
}

// 物流信息
- (IBAction)button2Action:(UIButton *)sender {
    
    NSInteger index = sender.tag;
    for (NSInteger i = 200; i <= index; i ++) {
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = YES;
    }
    
    for (NSInteger i = index+1 ; i <= 205; i ++) {
        
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = NO;
    }
    
    switch (index) {
        case 201:
            self.commentLabel2.text = @"非常差";
            break;
        case 202:
            self.commentLabel2.text = @"差";
            break;
        case 203:
            self.commentLabel2.text = @"一般";
            break;
        case 204:
            self.commentLabel2.text = @"好";
            break;
        case 205:
            self.commentLabel2.text = @"非常好";
            break;
        default:
            break;
    }
}

// 服务态度
- (IBAction)button3Action:(UIButton *)sender {
    NSInteger index = sender.tag;
    for (NSInteger i = 300; i <= index; i ++) {
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = YES;
    }
    
    for (NSInteger i = index+1 ; i <= 305; i ++) {
        
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = NO;
    }
    
    switch (index) {
        case 301:
            self.commentLabel3.text = @"非常差";
            break;
        case 302:
            self.commentLabel3.text = @"差";
            break;
        case 303:
            self.commentLabel3.text = @"一般";
            break;
        case 304:
            self.commentLabel3.text = @"好";
            break;
        case 305:
            self.commentLabel3.text = @"非常好";
            break;
        default:
            break;
    }
}

// 是否匿名
- (IBAction)hideNameButtonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

// 提交评价
- (IBAction)submitButtonAction:(UIButton *)sender {
    
    NewAppraiseSuccessViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewAppraiseSuccessViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}



@end

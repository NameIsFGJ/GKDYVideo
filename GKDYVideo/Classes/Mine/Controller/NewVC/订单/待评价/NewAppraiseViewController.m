//
//  NewAppraiseViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewAppraiseViewController.h"

@interface NewAppraiseViewController ()
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (weak, nonatomic) IBOutlet UIButton *bestButton;
@property (weak, nonatomic) IBOutlet UIButton *worstButton;
@property (weak, nonatomic) IBOutlet UIButton *middleButton;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel1;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel2;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel3;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@property (assign, nonatomic) int buttonTag;
@property (assign, nonatomic) int buttonSelectIndex;

@end

@implementation NewAppraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    [self.bestButton setImage:[UIImage imageNamed:@"好评2"] forState:UIControlStateNormal];
    
    [self.bestButton setImage:[UIImage imageNamed:@"好评"] forState:UIControlStateSelected];
    
    [self.middleButton setImage:[UIImage imageNamed:@"差评"] forState:UIControlStateNormal];
    
    [self.middleButton setImage:[UIImage imageNamed:@"差"] forState:UIControlStateSelected];
    
    [self.worstButton setImage:[UIImage imageNamed:@"差评"] forState:UIControlStateNormal];
    
    [self.worstButton setImage:[UIImage imageNamed:@"差"] forState:UIControlStateSelected];
    
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
    
    
    
    /*
     if ((self.btnTag != btn.tag) && (self.btnTag != -100)) {
     
     UIButton *btn = [self viewWithTag:self.btnTag];
     btn.selected = NO;
     btn.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
     }
     
     if (btn.selected == NO) {
     
     self.seletIndex = (int)btn.tag-100;
     btn.backgroundColor = [UIColor redColor];
     btn.selected = YES;
     self.btnTag = (int)btn.tag;
     
     }else
     {
     self.seletIndex = -1;
     btn.selected = NO;
     btn.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
     }
     */
    
}

// 上传照片
- (IBAction)photoButtonAction:(UIButton *)sender {
}
// 上传视频
- (IBAction)videoButtonAction:(UIButton *)sender {
}

// 描述相符
- (IBAction)button1Action:(UIButton *)sender {
    
}

// 物流信息
- (IBAction)button2Action:(UIButton *)sender {
}

// 服务态度
- (IBAction)button3Action:(UIButton *)sender {
}

// 是否匿名
- (IBAction)hideNameButtonAction:(UIButton *)sender {
}

// 提交评价
- (IBAction)submitButtonAction:(UIButton *)sender {
}



@end

//
//  NewEditViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewEditViewController.h"
#import "NewEditNameViewController.h"
#import "NewEditIDViewController.h"
#import "NewExplainViewController.h"
#import "NewTestViewController.h"
@interface NewEditViewController ()<TZImagePickerControllerDelegate>


@property (weak, nonatomic) IBOutlet UIView *view0;
@property (weak, nonatomic) IBOutlet UIImageView *headImgeView;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UIView *view5;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UIView *view6;
@property (weak, nonatomic) IBOutlet UILabel *label6;

@end

@implementation NewEditViewController

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
    label.text = @"个人中心";
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
    UITapGestureRecognizer *tap0 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushView0)];
    [self.view0 addGestureRecognizer:tap0];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushView1)];
    [self.view1 addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushView2)];
    [self.view2 addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushView3)];
    [self.view3 addGestureRecognizer:tap3];
    
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushView4)];
    [self.view4 addGestureRecognizer:tap4];
    
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushView5)];
    [self.view5 addGestureRecognizer:tap5];
    
    UITapGestureRecognizer *tap6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushView6)];
    [self.view6 addGestureRecognizer:tap6];
    
}

- (void)pushView0
{
    
    TZImagePickerController *vc = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
    [self.navigationController presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)pushView1
{
     NSLog(@"pushView1");
    NewEditNameViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewEditNameViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushView2
{
     NSLog(@"pushView2");
    NewEditIDViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewEditIDViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushView3
{
     NSLog(@"pushView3");
    NewTestViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewTestViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)pushView4
{
   NSLog(@"pushView4");
}

- (void)pushView5
{
    NSLog(@"pushView5");
}

- (void)pushView6
{
    NewExplainViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewExplainViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark TZImageDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto;
{
    self.headImgeView.image = [photos firstObject];
}

@end

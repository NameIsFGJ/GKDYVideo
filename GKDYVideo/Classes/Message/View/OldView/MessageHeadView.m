//
//  MessageHeadView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MessageHeadView.h"
#import "GetZanViewController.h"
#import "MyFansViewController.h"
@implementation MessageHeadView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSMutableArray *buttonArray = [NSMutableArray arrayWithObjects:self.getZanButton,self.myFansButton,self.getComButton, nil];
        NSArray *imageArray = [NSArray arrayWithObjects:@"getZanImage",@"myFansImage",@"getComImage", nil];
        NSArray *labelArray = [NSArray arrayWithObjects:@"收到的赞",@"粉丝",@"评论", nil];
     
        for (int  i = 0; i < 3; i ++) {
            UIButton *btn = buttonArray[i];
            [self addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(20);
                make.left.mas_equalTo(50+i*100);
                make.size.mas_equalTo(CGSizeMake(70, 75));
            }];
            btn.tag = 300 +i;
            [btn addTarget:self action:@selector(pushViewControll:) forControlEvents:UIControlEventTouchUpInside];
            
            UIImageView *btnImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageArray[i]]];
            [btn addSubview:btnImageView];
            
            [btnImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.top.mas_equalTo(0);
                 make.left.mas_equalTo(10);
                 make.size.mas_equalTo(CGSizeMake(50, 50));
            }];
            
            UILabel *btnLabel = [[UILabel alloc]init];
            [btn addSubview:btnLabel];
            btnLabel.text = labelArray[i];
            btnLabel.font = kFontSize(15);
            btnLabel.textAlignment = NSTextAlignmentCenter;
            btnLabel.textColor = [UIColor whiteColor];
            [btnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(btnImageView.mas_bottom).offset(10);
                    make.left.right.mas_equalTo(0);
            }];
        }
    }
    
    
    return self;
}

- (void)pushViewControll:(UIButton *)btn
{
    
    if (btn.tag == 300)
    {
        GetZanViewController *vc = [[GetZanViewController alloc]init];
        vc.type = getZanViewControllerType;
        vc.titleName = @"收到的赞";
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }else if (btn.tag == 301){
        MyFansViewController *vc = [[MyFansViewController alloc]init];
        [self.viewContainingController.navigationController pushViewController:vc animated:YES];
    }else if (btn.tag == 302){
        GetZanViewController *vc = [[GetZanViewController alloc]init];
        vc.type = getComViewControllerTyple;
        vc.titleName = @"评论";
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
   
}

- (UIButton *)getZanButton
{
    if (!_getZanButton) {
        _getZanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _getZanButton;
}

- (UIButton *)myFansButton
{
    if (!_myFansButton) {
        _myFansButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _myFansButton;
}

- (UIButton *)getComButton
{
    if (!_getComButton) {
        _getComButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _getComButton;
}
@end

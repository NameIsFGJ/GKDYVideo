//
//  TypeView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/28.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "TypeView.h"

@implementation TypeView

-(instancetype)initWithDatasource:(NSArray *)arr andTitleName:(NSString *)name;
{
    self = [super init];
    if (self)
    {
        UILabel *lab = [[UILabel alloc] init];
        [self addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(10);
        }];
        lab.text = name;
        lab.textColor = [UIColor blackColor];
        lab.font = [UIFont systemFontOfSize:14];
        
        float btnX = 10;
        float btnY = 40;
        self.seletIndex = -1;
        self.btnTag = -100;
        
        for (int i = 0; i<arr.count; i++) {
            NSString *str = [arr objectAtIndex:i] ;
            NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont boldSystemFontOfSize:14] forKey:NSFontAttributeName];
            CGSize size = [str sizeWithAttributes:dic];
            if ( btnX > (kWindowWidth-20 -size.width-35)) {
                
                btnX = 10;
                btnY += 50;
            }
            
            UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
            [self addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(btnX);
                make.top.mas_equalTo(btnY);
                make.size.mas_equalTo(CGSizeMake(size.width+60,35));
            }];
            
            [btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
            [btn setTitleColor:[UIColor blackColor] forState:0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [btn setTitle:[arr objectAtIndex:i] forState:0];
            btn.layer.cornerRadius = 8;
            btn.layer.borderColor = [UIColor clearColor].CGColor;
            btn.layer.borderWidth = 0;
            [btn.layer setMasksToBounds:YES];
            
            btn.tag = 100+i;
            [btn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
            btnX+=size.width+80;
        }
    }
    return self;
}

- (void)touchbtn:(UIButton *)btn
{
    
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
    
    
    [self.delegate btnIndexTypeView:self buttonTag:(int)btn.tag - 100];
}

@end

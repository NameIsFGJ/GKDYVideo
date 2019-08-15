//
//  GKDYUserVideoViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDYUserVideoViewController.h"

@interface GKDYUserVideoViewController ()

@end

@implementation GKDYUserVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.vcType == 0) {
        NSLog(@"我的作品");
    }else if (self.vcType == 1){
        NSLog(@"我喜欢的");
    }
}

@end

//
//  RankListViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "RankListViewController.h"
#import "LegalListTableViewCell.h"
@interface RankListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation RankListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView.panGestureRecognizer.rac_gestureSignal subscribeNext:^(UIPanGestureRecognizer * gesture) {
        if (self.block) {
            if ([gesture translationInView:self.view].y > 50) {
                self.block(YES);
            }
            if ([gesture translationInView:self.view].y < -40) {
                self.block(NO);
            }
        }
    }];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
    
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"LegalListTableViewCellID";
    LegalListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID  forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 210;
}

#pragma mark LoazLoad
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"LegalListTableViewCell" bundle:nil] forCellReuseIdentifier:@"LegalListTableViewCellID"];
    }
    return _tableView;
}

@end

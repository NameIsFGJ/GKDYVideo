//
//  LegalCopyViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "LegalCopyViewController.h"
#import "RankListTableViewCell.h"
#import "NewMarketGoodDetailViewController.h"

@interface LegalCopyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation LegalCopyViewController

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
    static NSString *cellID = @"RankListTableViewCellID";
    RankListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID  forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 191;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewMarketGoodDetailViewController *vc = [[NewMarketGoodDetailViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    

}

#pragma mark LoazLoad
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"RankListTableViewCell" bundle:nil] forCellReuseIdentifier:@"RankListTableViewCellID"];
    }
    return _tableView;
}


@end

//
//  NewWaitAppraiseViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewWaitAppraiseViewController.h"
#import "NewAllOrderTableViewCell.h"
#import "NewAppraiseViewController.h"
@interface NewWaitAppraiseViewController ()<UITableViewDelegate,UITableViewDataSource,OrderCellDelegate>

@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (strong, nonatomic)UITableView *mainView;

@end

@implementation NewWaitAppraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.mainView];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainView.frame = self.view.bounds;
}
#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"NewAllOrderTableViewCellID";
    NewAllOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.delegate = self;
    cell.button1.hidden = YES;
    [cell.button2 setTitle:@"查看物流" forState:UIControlStateNormal];
    [cell.button3 setTitle:@"评价" forState:UIControlStateNormal];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 205;
}

#pragma mark OrderButtonDelegate

- (void)button1Click:(UIButton *)sender;
{
    
}
- (void)button2Click:(UIButton *)sender;
{
//    NewAppraiseViewController *vc = [[NewAppraiseViewController alloc]init];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
}
- (void)button3Click:(UIButton *)sender;
{
    NewAppraiseViewController *vc = [kStoryboard5 instantiateViewControllerWithIdentifier:@"NewAppraiseViewController"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark loazLoad

- (UITableView *)mainView
{
    if (!_mainView) {
        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_mainView registerNib:[UINib nibWithNibName:@"NewAllOrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewAllOrderTableViewCellID"];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        
    }
    return _mainView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}


@end

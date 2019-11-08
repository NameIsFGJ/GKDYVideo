//
//  NewWaitPayViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewWaitPayViewController.h"
#import "NewAllOrderTableViewCell.h"
#import "NewWaitPayDetailViewController.h"
@interface NewWaitPayViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (strong, nonatomic)UITableView *mainView;


@end

@implementation NewWaitPayViewController

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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"NewAllOrderTableViewCellID";
    NewAllOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 205;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewWaitPayDetailViewController *vc = [[NewWaitPayDetailViewController alloc]init];
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

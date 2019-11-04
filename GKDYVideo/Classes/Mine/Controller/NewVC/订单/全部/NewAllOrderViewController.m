//
//  NewAllOrderViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewAllOrderViewController.h"
#import "NewAllOrderTableViewCell.h"
@interface NewAllOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (strong, nonatomic)UITableView *mainView;

@end

@implementation NewAllOrderViewController

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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 205;
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

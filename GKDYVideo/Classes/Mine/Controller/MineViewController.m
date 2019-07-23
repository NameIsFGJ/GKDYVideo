//
//  MineViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/17.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "MyIndexNetworking.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *imageArray;
@property (strong, nonatomic)NSMutableArray *titleArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.tableView];
    
   // MyIndexNetworking postMyIndex: userID:<#(nonnull NSNumber *)#> completionHandle:<#^(MyIndexModel * _Nonnull model, NSError * _Nonnull error)complectionhandle#>
    
}

#pragma mark UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    static NSString *cellID = @"MineTableViewCellID";
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.leftImageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    //cell.leftLabel.text = @"我的宝贝";
    cell.leftLabel.text = self.titleArray[indexPath.row];
    if (indexPath.row == 3) {
        cell.rightLabel.hidden = NO;
        cell.rightLabel.text = @"$100.00";
    }else{
        cell.rightLabel.hidden = YES;
    }
    return cell;
}

#pragma mark  loaz load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"MineTableViewCellID"];
    }
    return _tableView;
}

- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSMutableArray arrayWithObjects:@"my-fabu",@"my-order",@"my-order",@"my-money",@"my-play",@"my-save",@"my-service", nil];
    }
    return _imageArray;
}

- (NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray arrayWithObjects:@"我发布的",@"我卖出的",@"我买到的",@"我的钱包",@"我的视频",@"我的收藏",@"在线客服", nil];
    }
    return _titleArray;
}
@end


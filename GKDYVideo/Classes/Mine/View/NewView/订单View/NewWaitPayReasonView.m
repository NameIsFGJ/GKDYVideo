//
//  NewWaitPayReasonView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewWaitPayReasonView.h"
#import "NewWaitPayReasonViewCell.h"
#import "NewWaitPayReasonModel.h"
@interface NewWaitPayReasonView ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *itemsArray;
@property (strong, nonatomic) NSArray *modelArray;
@property (assign, nonatomic) BOOL isSelected;
@property (strong, nonatomic) NSIndexPath *lastSelected;
@end

@implementation NewWaitPayReasonView

- (instancetype)init
{
    self = [super init];
   // self.backgroundColor = [UIColor whiteColor];
    self.isSelected = NO;
    UIView *darkView = [[UIView alloc]init];
    [self addSubview:darkView];
    [darkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(202);
    }];
    darkView.backgroundColor = [UIColor blackColor];
    darkView.alpha = .5;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(tapButtonAction)];
    [darkView addGestureRecognizer:tap];
    
    UIView *contentView = [[UIView alloc]init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(darkView.mas_bottom);
    }];
    contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]init];
    [contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    label.text = @"退款内容";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:16];
    
    [contentView addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label.mas_bottom);
        make.height.mas_equalTo(self.itemsArray.count *53);
    }];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-13);
        make.right.equalTo(self.mas_centerX);
        make.left.mas_equalTo(15);
    }];
    [button1 setTitle:@"确定取消" forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"reasonLeft"] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-13);
        make.left.equalTo(self.mas_centerX);
        make.right.mas_equalTo(-15);
        
    }];
    [button2 setTitle:@"暂不取消" forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"reasonRight"] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
    
    
    return self;
}

- (void)tapButtonAction
{
    self.hidden = !self.hidden;
}

- (void)button1Action
{
    NSLog(@"确认取消");
}

- (void)button2Action
{
    NSLog(@"暂不取消");
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *cellID = @"NewWaitPayReasonViewCellID";
    NewWaitPayReasonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
 //   cell.model = self.modelArray[indexPath.row];
    cell.reasonLabel.text = self.itemsArray[indexPath.row];
    if (self.isSelected) {
        [cell.reasonButton setImage:[UIImage imageNamed:@"reasonSelected"] forState:UIControlStateNormal];
    }else{
        [cell.reasonButton setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 53;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *temp = self.lastSelected; //暂存上一次选中的行
    if (temp && (temp != indexPath)) {
        self.isSelected = NO;
        [tableView reloadRowsAtIndexPaths:@[temp] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    self.lastSelected = indexPath;
    self.isSelected = YES;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark
- (UITableView *)mainView
{
    if (!_mainView) {
        _mainView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        [_mainView registerNib:[UINib nibWithNibName:@"NewWaitPayReasonViewCell" bundle:nil] forCellReuseIdentifier:@"NewWaitPayReasonViewCellID"];
        _mainView.scrollEnabled = NO;
    }
    return _mainView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray arrayWithObjects:@"拍错/拍多/不想要",@"没用/少用优惠",@"信息填错",@"卖家缺货",@"未按约定时间发货",@"其他原因",nil];
    }
    return _itemsArray;
}

- (NSArray *)modelArray
{
    if (!_modelArray) {
        NewWaitPayReasonModel *model0 = [[NewWaitPayReasonModel alloc]init];
        //model0.isSelected = NO;
        NewWaitPayReasonModel *model1 = [[NewWaitPayReasonModel alloc]init];
      //  model1.isSelected = NO;
        NewWaitPayReasonModel *model2 = [[NewWaitPayReasonModel alloc]init];
      //  model2.isSelected = NO;
        NewWaitPayReasonModel *model3 = [[NewWaitPayReasonModel alloc]init];
      //  model3.isSelected = NO;
        NewWaitPayReasonModel *model4 = [[NewWaitPayReasonModel alloc]init];
       // model4.isSelected = NO;
        NewWaitPayReasonModel *model5 = [[NewWaitPayReasonModel alloc]init];
      //  model5.isSelected = NO;
        //_modelArray = [NSArray arrayWithObjects:model0,model1,model2,model3,model4,model5, nil];
    }
    return _modelArray;
}

@end

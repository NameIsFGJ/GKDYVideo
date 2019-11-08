//
//  NewMarketShopCartViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMarketShopCartViewController.h"
#import "NewCartTableViewCell.h"
#import "NewCartTableViewHeader.h"
#import "NewMarketShopCartModel.h"
#import "NewCartBottomView.h"
#import "NewMarketShopPaySuccessViewController.h"
@interface NewMarketShopCartViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *itemsArray;
@property (strong, nonatomic) NSMutableArray *selectArray;
@property (strong, nonatomic) NewCartBottomView *bottomView;
@property (strong, nonatomic) NSMutableArray *deleteArray;
@property (assign, nonatomic) BOOL deleteStatus;
@end

@implementation NewMarketShopCartViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kBgColor;
    
    [self makeNav];
    [self makeUI];
    [self networking];
    
    
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"购物车";
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"管理" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)pushViewController:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected)
    {
        self.deleteStatus = YES;
        // 合计
        self.bottomView.label1.hidden = YES;
        self.bottomView.totalPriceLabel.hidden = YES;
        self.bottomView.accountButton.hidden = YES;
        self.bottomView.deleteGoodsButton.hidden  = NO;
    }else
    {
        self.deleteStatus = NO;
        // 合计
        self.bottomView.label1.hidden = NO;
        self.bottomView.totalPriceLabel.hidden = NO;
        self.bottomView.accountButton.hidden = NO;
        self.bottomView.deleteGoodsButton.hidden  = YES;
    }
}

- (void)makeUI
{
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    if (IS_iPhoneX) {
        [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(210);
        }];
        view0.backgroundColor = kPickColor;
    }else
    {
        [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(188);
        }];
        view0.backgroundColor = kPickColor;
    }
    
    UILabel *totalLabel = [[UILabel alloc]init];
    [view0 addSubview:totalLabel];
    [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(KTopViewHeight);
        
    }];
    totalLabel.text = @"总共4件宝贝";
    totalLabel.font = [UIFont systemFontOfSize:15];
    totalLabel.textColor = [UIColor whiteColor];
    
    UIScrollView *mainView = [[UIScrollView alloc]init];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(105);
        make.bottom.mas_equalTo(-50);
    }];
    mainView.backgroundColor = [UIColor whiteColor];
    
    UIView *contentView = [[UIView alloc]init];
    [mainView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(mainView);
        make.width.equalTo(mainView);
    }];
    
    [contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(130*6);
    }];
    
    UIView *view1 = [[UIView alloc]init];
    [contentView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.tableView.mas_bottom);
        make.height.mas_equalTo(300);
    }];
    view1.backgroundColor = [UIColor blueColor];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view1);
    }];
    
    self.bottomView = [[NewCartBottomView alloc]init];
    [self.view addSubview:self.bottomView ];
    [self.bottomView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    self.bottomView .backgroundColor = [UIColor orangeColor];
    
    [self clickBottomView:self.bottomView];

}

- (void)clickBottomView:(NewCartBottomView *)bottomView
{
    @weakify(self)
    bottomView.clickBlock = ^(BOOL isClick) {
        if (isClick) {
            
            if (self.deleteStatus) {
                
                @strongify(self)
                
                for (GoodsModel *model in self.selectArray) {
                    [self.deleteArray removeObject:model];
                }
                
                for (NewMarketShopCartModel *sectionModel in self.itemsArray) {
                    sectionModel.isSelect = YES;
                    for (GoodsModel *goodsModel in sectionModel.goods) {
                        goodsModel.isSelect = YES;
                        [self.deleteArray addObject:goodsModel];
                    }
                }
                [self.tableView reloadData];
                
            }else{
                @strongify(self)
                for (GoodsModel *model in self.selectArray) {
                    [self.selectArray removeObject:model];
                }
                for (NewMarketShopCartModel *sectionModel in self.itemsArray) {
                    sectionModel.isSelect = YES;
                    for (GoodsModel *goodsModel in sectionModel.goods) {
                        goodsModel.isSelect = YES;
                        [self.selectArray addObject:goodsModel];
                    }
                }
                [self.tableView reloadData];
                [self totalPriceArray];
            }
            
        }else{
            
            if (self.deleteStatus) {
                for (NewMarketShopCartModel *sectionModel in self.itemsArray) {
                    sectionModel.isSelect = NO;
                    for (GoodsModel *goodsModel in sectionModel.goods) {
                        goodsModel.isSelect = NO;
                        [self.deleteArray removeObject:goodsModel];
                    }
                }
                [self.tableView reloadData];
            }else
            {
                for (NewMarketShopCartModel *sectionModel in self.itemsArray) {
                    sectionModel.isSelect = NO;
                    for (GoodsModel *goodsModel in sectionModel.goods) {
                        goodsModel.isSelect = NO;
                        [self.selectArray removeObject:goodsModel];
                    }
                }
                [self.tableView reloadData];
                [self totalPriceArray];
            }
        }
    };
    
    // 结算
    bottomView.totalBlock = ^{
        NewMarketShopPaySuccessViewController *vc = [[NewMarketShopPaySuccessViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    
}


- (void)networking
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShopCarNew" ofType:@"plist"];
    NSDictionary *dataDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *data = dataDic[@"data"];
    
    for (NSDictionary *dic in data) {
        NewMarketShopCartModel *model = [NewMarketShopCartModel yy_modelWithDictionary:dic];
        [self.itemsArray addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark Actions

//  cell 的方法
- (void)cellSelect:(NewCartTableViewCell *)cell andSectionModel:(NewMarketShopCartModel *)sectionModel andRowModel:(GoodsModel *)rowModel andIndexPath:(NSIndexPath *)indexPath
{
    cell.clickRow = ^(BOOL isSelected) {
        if (isSelected) {
            rowModel.isSelect = YES;
            [self.selectArray addObject:rowModel];
            
            if (self.deleteStatus)
            {
                [self.deleteArray addObject:rowModel];
            }
            
        }else{
            [self.selectArray removeObject:rowModel];
            rowModel.isSelect = NO;
            
            if (self.deleteStatus)
            {
                [self.deleteArray removeObject:rowModel];
            }
        }
        // 是否全选,当物品有仅且有一个的时候, headView 的全选按钮为选中状态
        [self headViewSelect:indexPath.section];
        // 分区的全选按钮选中
        [self bottomViewSelect];
        // 总价
        [self totalPriceArray];
    };
    
    
    cell.addCount = ^(UILabel * _Nonnull label) {
        rowModel.count = [label.text integerValue];
        if ([self.selectArray containsObject:rowModel]) {
            [self.selectArray removeObject:rowModel];
            [self.selectArray addObject:rowModel];
            [self totalPriceArray];
        }
    };
    
    cell.lostCount = ^(UILabel * _Nonnull label) {
        rowModel.count = [label.text integerValue];
        if ([self.selectArray containsObject:rowModel]) {
            [self.selectArray removeObject:rowModel];
            [self.selectArray addObject:rowModel];
            [self totalPriceArray];
        }
    };
}

- (void)headViewSelect:(NSInteger)section
{
    NewMarketShopCartModel *sectionModel = self.itemsArray[section];
    
    BOOL isSelectSetion = YES;
    for (GoodsModel *rowModel in sectionModel.goods) {
        if (rowModel.isSelect == NO) {
            isSelectSetion = NO;
            break;
        }
    }
    
    // 全选之后,改变 headView 的状态
    NewCartTableViewHeader *headView = (NewCartTableViewHeader *)[self.tableView headerViewForSection:section];
    headView.isClick = isSelectSetion;
    sectionModel.isSelect = isSelectSetion;
}

//  headView 的方法
- (void)cellHeadView:(NewCartTableViewHeader *)headView andSectionModel:(NewMarketShopCartModel *)sectionModel
{
    headView.clickSection = ^(BOOL isSelected) {
        
        sectionModel.isSelect = isSelected;
        
        if (isSelected)
        {
            for (GoodsModel *model in sectionModel.goods)
            {
                model.isSelect = YES;
                if (![self.selectArray containsObject:model])
                {
                    [self.selectArray addObject:model];
                    
                }
                
                if (self.deleteStatus)
                {
                    if (![self.deleteArray containsObject:model]) {
                        [self.deleteArray addObject:model];
                    }
                }
            }
        }
        else
        {
            for (GoodsModel *model in sectionModel.goods)
            {
                model.isSelect = NO;
                if ([self.selectArray containsObject:model])
                {
                    [self.selectArray removeObject:model];
                }
                if (self.deleteStatus)
                {
                    if ([self.deleteArray containsObject:model])
                    {
                        [self.deleteArray removeObject:model];
                    }
                }
            }
        }
        [self bottomViewSelect];
        [self.tableView reloadData];
        [self totalPriceArray];
        
    };
}

//  计算总价
- (void)totalPriceArray
{
    double totalPrice = 0.00;
    
    for (GoodsModel *model in self.selectArray) {
        totalPrice += model.orginalPrice * model.count;
    }
    
    self.bottomView.totalPriceLabel.text = [NSString stringWithFormat:@"%.2f",totalPrice];
}

// 底部的 全选按钮
- (void)bottomViewSelect
{
    NSInteger count = 0;
    for (NewMarketShopCartModel *model in self.itemsArray) {
        count += model.goods.count;
    }
    
    if (count == self.selectArray.count) {
        self.bottomView.isClick = YES;
    }else{
        self.bottomView.isClick = NO;
    }
    
}
#pragma mark TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return self.itemsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    NewMarketShopCartModel *model = self.itemsArray[section];
    return model.goods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"NewCartTableViewCellID";
    NewCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NewMarketShopCartModel *sectionModel = self.itemsArray[indexPath.section];
    GoodsModel *rowModel = sectionModel.goods[indexPath.row];
    cell.model  = rowModel;
    
    [self cellSelect:cell andSectionModel:sectionModel andRowModel:rowModel andIndexPath:indexPath];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NewCartTableViewHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"NewCartTableViewHeaderID"];
    
    NewMarketShopCartModel *model = self.itemsArray[section];
    header.model = model;
    
    [self cellHeadView:header andSectionModel:model];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

#pragma mark LazyLoad
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"NewCartTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewCartTableViewCellID"];
        [_tableView registerClass:[NewCartTableViewHeader class] forHeaderFooterViewReuseIdentifier:@"NewCartTableViewHeaderID"];
    }
    return _tableView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

- (NSMutableArray *)selectArray
{
    if (!_selectArray) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray;
}

- (NSMutableArray *)deleteArray
{
    if (!_deleteArray) {
        _deleteArray = [NSMutableArray array];
    }
    return _deleteArray;
}

@end

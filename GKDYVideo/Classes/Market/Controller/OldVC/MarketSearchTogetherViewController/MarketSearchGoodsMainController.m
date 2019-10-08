//
//  MarketSearchGoodsMainController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketSearchGoodsMainController.h"
#import "SearchView.h"
#import "MarketSearchTogetherViewController.h"
#import "MarketSearchSaleViewController.h"
#import "MarketSearchPriceViewController.h"
@interface MarketSearchGoodsMainController()<UITextFieldDelegate,WMPageControllerDataSource>
@property (strong, nonatomic)UIView *navView;
@property (strong, nonatomic)SearchView *searchView;
@property (strong, nonatomic)NSArray *titleArray;

@end

@implementation MarketSearchGoodsMainController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatNav];
}

- (instancetype)init
{
    if (self = [super init]) {
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleColorNormal = [UIColor blackColor];
        self.titleColorSelected = [UIColor orangeColor];
    }
    return self;
}
#pragma mark Action
- (void)creatNav
{
    self.navView = [[UIView alloc]init];
    [self.view addSubview:self.navView];
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(KTopViewHeight);
    }];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navView addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(25);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [backButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navView addSubview:self.searchView];
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.top.mas_equalTo(25);
        make.size.mas_equalTo(CGSizeMake(260, 34));
    }];
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark WMPageControllerDelegate
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    return CGRectMake(0, KTopViewHeight, kWindowWidth, 40);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView;
{
    return CGRectMake(0, KTopViewHeight + 40 + 16, kWindowWidth, kWindowHeight - KTopViewHeight-40);
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController;
{
    return self.titleArray.count;
}
- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index;
{
    switch (index) {
        case 0:{
            MarketSearchTogetherViewController * vc = [[MarketSearchTogetherViewController alloc]init];
            vc.searchStr = self.searchStr;
            return vc;
        }
            break;
        case 1:{
            MarketSearchSaleViewController * vc = [[MarketSearchSaleViewController alloc]init];
            vc.searchStr = self.searchStr;
            return vc;
        }
            break;
        case 2:{
            MarketSearchPriceViewController * vc = [[MarketSearchPriceViewController alloc]init];
            vc.searchStr = self.searchStr;
            return vc;
        }
            break;
            
        default:
            break;
    }
    return nil;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index;
{
    return self.titleArray[index];
}

#pragma mark 懒加载
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"综合",@"销售",@"价格", nil];
    }
    return _titleArray;
}

- (SearchView *)searchView
{
    if (!_searchView) {
        _searchView = [[SearchView alloc]init];
        _searchView.backgroundColor = [UIColor whiteColor];
        _searchView.layer.borderWidth = .6;
        _searchView.layer.borderColor = [UIColor blackColor].CGColor;
        _searchView.lineView.backgroundColor = [UIColor lightGrayColor];
        _searchView.searchImageView.image = [UIImage imageNamed:@"searchGrayImage"];
        [_searchView.cleanSearchButton setImage:[UIImage imageNamed:@"deleteGrayImage"] forState:UIControlStateNormal];
        _searchView.searchTextField.text = self.searchStr;
        _searchView.searchTextField.delegate = self;
        _searchView.searchTextField.keyboardType = UIKeyboardTypeWebSearch;
    }
    return _searchView;
}

@end

//
//  SearchMainViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/28.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SearchMainViewController.h"
// 综合
#import "SearchTogetherViewController.h"
// 用户
#import "SearchUserViewController.h"
// 音乐
#import "SearchMusicViewController.h"
// 视频
#import "SearchTopicViewController.h"

#import "SearchView.h"

// 用户 networking
#import "SearchUsersNetworking.h"
#import "SearchUserModel.h"

// 综合 (视频)
#import "SearchVideosNetworking.h"
#import "SearchVideoModel.h"
@interface SearchMainViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)NSArray *titleArray;
@property (strong, nonatomic)UIView *navView;
@property (strong, nonatomic)SearchView *searchView;
@property (assign, nonatomic)NSInteger currentIndex;
@property (strong, nonatomic)NSMutableArray *searchUserArray;
@end

@implementation SearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.view.backgroundColor = kMainColor
    [self creatNav];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (instancetype)init
{
    if (self = [super init]) {
        self.titleSizeSelected = 15;
        self.titleSizeNormal = 15;
        self.titleColorSelected = kWhiteColor;
        self.titleColorNormal = kWhiteColor;
        self.menuViewStyle = WMMenuViewStyleLine;
        
    }
    return self;
}
- (void)creatNav
{
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 64)];
    [self.view addSubview:self.navView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navView addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 25, 40, 40);
    [backButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navView addSubview:self.searchView];
    self.searchView.frame = CGRectMake(40, 25, 260, 34);
    self.searchView.searchTextField.text = self.searchContentString;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
//    NSString *value = textField.text;
//    NSString *key = [self getCurrentTimes];
//    NSDictionary *dic = [NSDictionary dictionaryWithObject:value forKey:key];
//    NSMutableArray *muArray = [NSMutableArray arrayWithArray:kUser.history];
//    [muArray addObject:dic];
//
//    [[NSUserDefaults standardUserDefaults] setObject:muArray forKey:@"khistory"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//
    return YES;
}

-(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYYMMddHHmmss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    return currentTimeString;
    
}

- (void)buttonAction
{
    NSLog(@"点击");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clearSearchHistoryButtonAction
{
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"khistory"];
  //  self.itemsArray = nil;
  //  self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWindowWidth, self.itemsArray.count *40);
   // [self.tableView reloadData];
}

#pragma mark UIPageViewControllerDelegate
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    return CGRectMake(0, 64, kWindowWidth, 40);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView;
{
    return CGRectMake(0, 114, kWindowWidth, kWindowHeight - 114-44);
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController;
{
    return  self.titleArray.count;
}

- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index;
{
    if (index == 0)
    {
        SearchTogetherViewController *togetherVC = [[SearchTogetherViewController alloc]init];
          togetherVC.view.tag = 200;
        return togetherVC;
    }else if (index == 1){
        SearchUserViewController *userVC = [[SearchUserViewController alloc]init];
        userVC.view.tag = 201;
        return userVC;
    }else if (index == 2){
        SearchMusicViewController *musicVC = [[SearchMusicViewController alloc]init];
        musicVC.view.tag = 202;
        return musicVC;
    }else{
        SearchTopicViewController *topicVC = [[SearchTopicViewController alloc]init];
        topicVC.view.tag = 203;
        return topicVC;
    }
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index;
{
    return self.titleArray[index];
}
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info;
{
    self.currentIndex = viewController.view.tag - 200;
    
    if (self.currentIndex == 0)
    {
        [SearchVideosNetworking postSearchVideoWithPage:1
                                                keyword:@"昵称"
                                                 userId:[kUser.user_id integerValue] completion:^(NSMutableArray * _Nonnull modelArray, NSError * _Nonnull error) {
                                                     SearchTogetherViewController *view = (SearchTogetherViewController *)viewController;
                                                     view.itemsArray = modelArray;
                                                     SearchVideoModel *model = [modelArray firstObject];
                                                     NSLog(@"model.pic_url  =%@",model.pic_url);
                                                     [view.collectionView reloadData];
                                                     NSLog(@"mode3lArray.count  =%ld",modelArray.count);
        }];
    }else if (self.currentIndex == 1){
        [SearchUsersNetworking postSearchUsers:1
                                      keyworld:@"昵称"
                                       user_id:[kUser.user_id integerValue] completionHandle:^(NSMutableArray * _Nonnull modelArray, NSError * _Nonnull error) {
            
            SearchUserViewController *view = (SearchUserViewController *)viewController;
            view.itemArray = modelArray;
            [view.tableView reloadData];
        }];
    }
}

#pragma mark 懒加载
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"综合",@"用户",@"音乐",@"话题", nil];
    }
    return _titleArray;
}

- (SearchView *)searchView
{
    if (!_searchView)
    {
        _searchView = [[SearchView alloc]init];
        _searchView.searchTextField.delegate = self;
        _searchView.searchTextField.keyboardType = UIKeyboardTypeWebSearch;
    }
    return _searchView;
}

- (NSMutableArray *)searchUserArray
{
    if (!_searchUserArray)
    {
        _searchUserArray = [NSMutableArray array];
    }
    return _searchUserArray;
}

@end


//
//  NewHistoryViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewHistoryViewController.h"
#import "NewHistoryGoodsViewController.h"
#import "NewHistoryArticleViewController.h"

typedef enum : NSUInteger {
    AnimationDirectionForward,
    AnimationDirectionReverse,
    
} AnimationDirection;

@interface NewHistoryViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *vcArray;
@property (strong, nonatomic) NewHistoryArticleViewController *articleVC;
@property (strong, nonatomic) NewHistoryGoodsViewController *goodsVC;
@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIView *lineView0;

@end

@implementation NewHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kWhiteColor;
    
    [self makeNav];
    
    [self makeUI];
}

- (void)makeNav
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"我的打赏";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    UIView *lineView = [[UIView alloc]init];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(.5);
    }];
    lineView.backgroundColor = kBgColor;
    
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(lineView.mas_bottom);
        make.height.mas_equalTo(50);
    }];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:self.button1];
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2, 49));
    }];
    [self.button1 setTitle:@"文章浏览" forState:UIControlStateNormal];
    self.button1.titleLabel.font = kFontSize(15);
    [self.button1 setTitleColor:kPickColor forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(changeButtonAction1) forControlEvents:UIControlEventTouchUpInside];
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:self.button2];
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2, 49));
    }];
    [self.button2 setTitle:@"商品浏览" forState:UIControlStateNormal];
    self.button2.titleLabel.font = kFontSize(15);
    [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [self.button2 addTarget:self action:@selector(changeButtonAction2) forControlEvents:UIControlEventTouchUpInside];
    
    self.lineView0 = [[UIView alloc]init];
    [view0 addSubview:self.lineView0];
    [self.lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(60, 1));
        make.centerX.equalTo(self.button1.mas_centerX);
    }];
    self.lineView0.backgroundColor = kPickColor;
    
    UIView *contentView = [[UIView alloc]init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom);
    }];
    contentView.backgroundColor = kBgColor;
    
    [self addChildViewController:self.pageViewController];
    [contentView addSubview:self.pageViewController.view];
    self.pageViewController.view.frame = contentView.bounds;
}

#pragma mark Actions
- (void)changeButtonAction1
{
   [self.pageViewController setViewControllers:@[self.articleVC] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
     [self startAnimationWithDirection:AnimationDirectionForward];
}

- (void)changeButtonAction2
{
    [self.pageViewController setViewControllers:@[self.goodsVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self startAnimationWithDirection:AnimationDirectionReverse];
}

- (void)startAnimationWithDirection:(AnimationDirection)direction
{
    @weakify(self)
    if (direction == AnimationDirectionForward) {
        [UIView animateWithDuration:.3 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            @strongify(self)
            [self.button1 setTitleColor:kPickColor forState:UIControlStateNormal];
            [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

            [self.button1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.top.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(kWindowWidth/2, 49));
            }];
            [self.button2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.top.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(kWindowWidth/2, 49));
            }];
            [self.lineView0 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(60, 1));
                make.centerX.equalTo(self.button1.mas_centerX);
            }];
            [self.view layoutIfNeeded];
            
        } completion:nil];
    }else if (direction == AnimationDirectionReverse){
      
        [UIView animateWithDuration:.3 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            @strongify(self)
            [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
          
            [self.button2 setTitleColor:kPickColor forState:UIControlStateNormal];
            [self.button1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.top.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(kWindowWidth/2, 49));
            }];
            [self.button2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.top.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(kWindowWidth/2, 49));
            }];
            [self.lineView0 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(60, 1));
                make.centerX.equalTo(self.button2.mas_centerX);
            }];
            [self.view layoutIfNeeded];
            
        } completion:nil];

    }
}

#pragma mark UIPageViewControllerDelegate
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([viewController isEqual:self.articleVC]) {
        return nil;
    }else
    {
        return self.articleVC;
    }
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if ([viewController isEqual:self.goodsVC]) {
        return nil;
    }else
    {
        return self.goodsVC;
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed;
{
    if (!completed)
    {
        return;
    }
    
    if ([previousViewControllers.firstObject isEqual:self.articleVC])
    {
         [self startAnimationWithDirection:AnimationDirectionReverse];
        
    }else
    {
        [self startAnimationWithDirection:AnimationDirectionForward];
    }
}

#pragma mark lazyLoad
- (UIPageViewController *)pageViewController
{
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [_pageViewController setViewControllers:@[self.articleVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
    }
    return _pageViewController;
}

- (NewHistoryArticleViewController *)articleVC
{
    if (!_articleVC) {
        _articleVC = [[NewHistoryArticleViewController alloc]init];
    }
    return _articleVC;
}

- (NewHistoryGoodsViewController *)goodsVC
{
    if (!_goodsVC) {
        _goodsVC = [[NewHistoryGoodsViewController alloc]init];
    }
    return _goodsVC;
}

- (NSArray *)vcArray
{
    if (!_vcArray) {
        
        _vcArray = [NSArray arrayWithObjects:self.goodsVC,self.articleVC, nil];
    }
    return _vcArray;
}

@end

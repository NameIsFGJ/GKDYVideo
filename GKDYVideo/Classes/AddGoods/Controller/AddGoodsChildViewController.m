//
//  AddGoodsChildViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/31.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddGoodsChildViewController.h"

static NSInteger currentButtonTag = 0;
@interface AddGoodsChildViewController ()<TZImagePickerControllerDelegate>
@property (strong, nonatomic)UIScrollView *mainView;
@property (strong, nonatomic)UIView *contentView;
@property (strong, nonatomic)UIView *headView;
@property (strong, nonatomic)UIView *pictureView;
@property (strong, nonatomic)UIView *bottomView;
@property (strong,nonatomic)UITextField *titleTextField;
@property (strong,nonatomic)UITextField *descTextField;
@property (strong, nonatomic)UIButton *addImageButton;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@end

@implementation AddGoodsChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title  = @"发布宝贝";
    
    [self.view addSubview:self.mainView];
    self.mainView.frame = self.view.bounds;
    
    [self.mainView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainView);
        make.width.equalTo(self.mainView);
    }];

    [self.mainView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(270);
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    [self.headView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(.4);
        }];
    lineView1.backgroundColor = [UIColor colorWithHex:@"#F1F1F1"];
    
    [self.headView addSubview:self.titleTextField];
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(10);
                make.top.equalTo(lineView1.mas_bottom).offset(5);
                make.right.mas_equalTo(10);
                make.height.mas_equalTo(45);
            }];

    UIView *lineView2 = [[UIView alloc]init];
    [self.headView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleTextField.mas_bottom).offset(5);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(.5);
        }];
    lineView2.backgroundColor = [UIColor colorWithHex:@"#F1F1F1"];
    
    [self.headView addSubview:self.descTextField];
    [self.descTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView2.mas_bottom).offset(5);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(45);
        }];
    
    // 可变化
    [self.headView addSubview:self.pictureView];
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.descTextField.mas_bottom).offset(50);
        make.height.mas_equalTo(85);
    }];
    
    [self.pictureView addSubview:self.addImageButton];
    [self.addImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(0);
                make.left.mas_equalTo(10);
                make.size.mas_equalTo(CGSizeMake(75, 85));
            }];

    [self.contentView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.headView.mas_bottom).offset(10);
        make.height.mas_equalTo(900);
    }];
    
    UIView *itemView = [[UIView alloc]init];
    itemView.backgroundColor = [UIColor redColor];
    [self.bottomView addSubview:itemView];
    [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_offset(50);
    }];
    
    UIButton *priceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemView addSubview:priceButton];
    [priceButton setTitle:@"一口价" forState:UIControlStateNormal];
    [priceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [priceButton.titleLabel setFont:kFontSize(18)];
   // priceButton
    UIButton *rentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemView addSubview:rentButton];
    [rentButton setBackgroundColor:[UIColor blueColor]];
    [rentButton setTitle:@"租赁" forState:UIControlStateNormal];
    [rentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rentButton.titleLabel setFont:kFontSize(18)];
    
    NSArray *buttonArray = [NSArray arrayWithObjects:priceButton,rentButton, nil];
    [buttonArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
    }];
}

- (UIBarButtonItem *)backButtonItems
{
    UIImage *img = [UIImage imageNamed:@"fanhuiImage"];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:img
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(actionBack:)];
    item.tintColor = [UIColor blackColor];
    return item;
}

- (void)actionBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addImageButtonAction
{
    TZImagePickerController *pickerVC = [[TZImagePickerController alloc]initWithMaxImagesCount:8 delegate:self];
    // 允许选择图片
    pickerVC.allowPickingImage = YES;
    [self presentViewController:pickerVC animated:YES completion:^{
        
    }];
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto;
{
    
    if (photos.count <= 3) {
        for (int i = 0; i < photos.count; i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.pictureView addSubview:btn];
            btn.tag = 200+i;
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                make.left.mas_equalTo(10+ 85*i);
                make.size.mas_equalTo(CGSizeMake(75, 85));
            }];
            [btn setImage:photos[i] forState:UIControlStateNormal];
            [btn addTarget:self
                    action:@selector(imageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            if (photos.count - i == 1)
            {
                [self.addImageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                    make.left.equalTo(btn.mas_right).offset(10);
                    make.size.mas_equalTo(CGSizeMake(75, 85));
                }];
            }
        }
    }else if (photos.count == 4)
    {
        for (int i = 0; i <= 3; i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.pictureView addSubview:btn];
            btn.tag = 200+i;
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                make.left.mas_equalTo(10+ 85*i);
                make.size.mas_equalTo(CGSizeMake(75, 85));
            }];
            [btn setImage:photos[i] forState:UIControlStateNormal];
            [btn addTarget:self
                    action:@selector(imageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            if (photos.count - i == 1)
            {
                [self.addImageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(btn.mas_bottom).offset(10);
                    make.left.mas_equalTo(10);
                    make.size.mas_equalTo(CGSizeMake(75, 85));
                }];
            }
            
            [self.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                make.height.mas_equalTo(90 *2);
            }];
            
            [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.mas_equalTo(0);
                make.height.mas_equalTo(270+ 90);
            }];
      }
  }else if (photos.count > 4 && photos.count < 8)
  {
      for (int i = 0; i < 2; i++) {
          for (int j = 0; j < 4; j++) {
              if ((4*i +j) > (photos.count-1))
              {
                  
              }else
              {
                  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                  [self.pictureView addSubview:btn];
                  btn.tag = 200+i;
                  [btn addTarget:self
                          action:@selector(imageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                      make.top.equalTo(self.descTextField.mas_bottom).offset(50+ 95*i);
                      make.left.mas_equalTo(10+ 85*j);
                      make.size.mas_equalTo(CGSizeMake(75, 85));
                  }];
                  [btn setImage:photos[4*i + j] forState:UIControlStateNormal];
                  if ( photos.count- (4*i + j) == 1)
                  {
                      [self.addImageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                          make.top.equalTo(self.descTextField.mas_bottom).offset(95+50);
                          make.left.equalTo(btn.mas_right).offset(10);
                          make.size.mas_equalTo(CGSizeMake(75, 85));
                      }];
                  }
                  [self.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
                      make.left.right.mas_equalTo(0);
                      make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                      make.height.mas_equalTo(90 *2);
                  }];
                  
                  [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
                      make.left.right.top.mas_equalTo(0);
                      make.height.mas_equalTo(270+ 90);
                  }];
                  
              }
           }
        }
      }else if (photos.count == 8)
      {
          for (int i = 0; i < 2; i++) {
              for (int j = 0; j < 4; j++) {
                  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                  [self.pictureView addSubview:btn];
                  btn.tag = 200+i;
                  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                      make.top.equalTo(self.descTextField.mas_bottom).offset(50+ 95*i);
                      make.left.mas_equalTo(10+ 85*j);
                      make.size.mas_equalTo(CGSizeMake(75, 85));
                  }];
                  [btn setImage:photos[4*i + j] forState:UIControlStateNormal];
              }
          }
          [self.addImageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
              make.top.equalTo(self.descTextField.mas_bottom).offset(95*2+50);
              make.left.mas_equalTo(10);
              make.size.mas_equalTo(CGSizeMake(75, 85));
          }];
          
          [self.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
              make.left.right.mas_equalTo(0);
              make.top.equalTo(self.descTextField.mas_bottom).offset(50);
              make.height.mas_equalTo(90 *3);
          }];
          
          [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
              make.left.right.top.mas_equalTo(0);
              make.height.mas_equalTo(270+ 90*2);
          }];
      }
}

- (void)imageButtonAction:(UIButton *)btn
{
    NSLog(@"btn.tag ==%ld",btn.tag);
}

#pragma mark  懒加载
- (UIScrollView *)mainView
{
    if (!_mainView) {
        _mainView = [[UIScrollView alloc]init];
        _mainView.showsVerticalScrollIndicator = NO;
        _mainView.showsHorizontalScrollIndicator = NO;
        _mainView.bounces = NO;
    }
    return _mainView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor colorWithHex:@"#F1F1F1"];
    }
    return _contentView;
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = [UIColor whiteColor];
    }
    return _headView;
}

- (UITextField *)titleTextField
{
    if (!_titleTextField) {
        _titleTextField = [[UITextField alloc]init];
        _titleTextField.font = kFontSize(15);
        _titleTextField.placeholder = @"请您填写商品的标题,以便吸引更多买家";
        [_titleTextField setTextColor:[UIColor blackColor]];
    }
    return _titleTextField;
}

- (UITextField *)descTextField
{
    if (!_descTextField) {
        _descTextField = [[UITextField alloc]init];
        [_descTextField setFont:kFontSize(13)];
        [_descTextField setTextColor:[UIColor blackColor]];
        _descTextField.placeholder = @"请您填写商品的详情,以便买家更好的了解您的商品";
    }
    return _descTextField;
}
- (UIView *)pictureView
{
    if (!_pictureView) {
        _pictureView = [[UIView alloc]init];
    }
    return _pictureView;
}

- (UIButton *)addImageButton
{
    if (!_addImageButton) {
        _addImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addImageButton setImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
        [_addImageButton addTarget:self action:@selector(addImageButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addImageButton;
}
- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

@end

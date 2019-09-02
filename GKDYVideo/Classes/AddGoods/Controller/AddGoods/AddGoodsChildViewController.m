//
//  AddGoodsChildViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/31.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddGoodsChildViewController.h"
#import "AddGoodsInfoView.h"
#import "AddGoodsNetworking.h"
#import "AddGoodsInfoModel.h"
#import "AddGoodsModel.h"
@interface AddGoodsChildViewController ()<TZImagePickerControllerDelegate>
@property (strong, nonatomic)UIScrollView *mainView;
@property (strong, nonatomic)UIView *contentView;
@property (strong, nonatomic)UIView *headView;
@property (strong, nonatomic)UIView *pictureView;
@property (strong, nonatomic)UIView *bottomView;
@property (strong,nonatomic)UITextField *titleTextField;
@property (strong,nonatomic)UITextField *descTextField;
@property (strong, nonatomic)UIButton *addImageButton;
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)UIView *typeButtonLineView;
@property (strong, nonatomic)AddGoodsInfoView *priceView;
@property (strong, nonatomic)AddGoodsInfoView *countView;
@property (strong, nonatomic)AddGoodsInfoView *typeView;
@property (strong, nonatomic)AddGoodsInfoView *videoView;
@property (strong, nonatomic)UIButton *submitButton;
// 9 宫格的button
@property (strong, nonatomic)UIButton *firstButton;
@property (strong, nonatomic)UIButton *secondButton;
@property (strong, nonatomic)UIButton *thirdButton;
@property (strong, nonatomic)UIButton *fourthButton;
@property (strong, nonatomic)UIButton *fifthButton;
@property (strong, nonatomic)UIButton *sixthButton;
@property (strong, nonatomic)UIButton *seventhButton;
@property (strong, nonatomic)UIButton *eighthButton;

@property (strong, nonatomic)NSMutableArray *buttonArray;
@end

@implementation AddGoodsChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title  = @"发布宝贝";
    
    [self.view addSubview:self.mainView];
    self.mainView.frame = self.view.bounds;
    [self.mainView setBackgroundColor: [UIColor yellowColor]];
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
    // 8个button
   // self.buttonArray
    self.buttonArray = [NSMutableArray arrayWithObjects:self.firstButton,self.secondButton,self.thirdButton,self.fourthButton,self.fifthButton,self.sixthButton,self.seventhButton,self.eighthButton, nil];
    
    for (UIButton *btn in self.buttonArray) {
        [self.pictureView addSubview:btn];
    }
    
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
    [self.bottomView addSubview:itemView];
    [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_offset(50);
    }];
    
    UIButton *priceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemView addSubview:priceButton];
    priceButton.tag = 300;
    [priceButton setTitle:@"一口价" forState:UIControlStateNormal];
    [priceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [priceButton.titleLabel setFont:kFontSize(18)];
    [priceButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
   // priceButton
    UIButton *rentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemView addSubview:rentButton];
    rentButton.tag = 301;
    [rentButton setTitle:@"租赁" forState:UIControlStateNormal];
    [rentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rentButton.titleLabel setFont:kFontSize(18)];
    [rentButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *buttonArray = [NSArray arrayWithObjects:priceButton,rentButton, nil];
    [buttonArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [buttonArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(2);
        make.top.mas_equalTo(0);
    }];
    
    [itemView addSubview:self.typeButtonLineView];
    [self.typeButtonLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(2);
        make.width.mas_equalTo((kWindowWidth - 20)/2);
    }];
    
    [self.bottomView addSubview:self.priceView];
    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.top.equalTo(itemView.mas_bottom);
    }];
    
    [self.bottomView addSubview:self.countView];
    [self.countView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.top.mas_equalTo(self.priceView.mas_bottom);
    }];

    [self.bottomView addSubview:self.typeView];
    [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.top.mas_equalTo(self.countView.mas_bottom);
    }];
    
    [self.bottomView addSubview:self.videoView];
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.top.mas_equalTo(self.typeView.mas_bottom);
    }];
    
    [self.bottomView addSubview:self.submitButton];
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.videoView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.headView.mas_bottom).offset(10);
        make.bottom.equalTo(self.submitButton.mas_bottom).offset(0);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
    }];
}

#pragma mark Action
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

- (void)typeButtonAction:(UIButton*)btn
{
    if (btn.tag == 300) {
        
        [self.typeButtonLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(2);
            make.width.mas_equalTo((kWindowWidth - 20)/2);
        }];
    }else if (btn.tag == 301){
        [self.typeButtonLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo((kWindowWidth - 20)/2+10);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(2);
            make.width.mas_equalTo((kWindowWidth - 20)/2);
        }];
    }
}

// 点击照片方法
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
    self.itemsArray = nil;
    self.itemsArray = photos;
}

- (void)imageButtonAction:(UIButton *)btn
{
    NSLog(@"btn.tag ==%ld",btn.tag);
}

- (void)submitButtonAction
{
    [self showProgress];
    AddGoodsInfoModel *infoModel = [[AddGoodsInfoModel alloc]init];
    infoModel.user_token = kUser.user_token;
    infoModel.user_id = [kUser.user_id integerValue];
    infoModel.title = @"mac pro";
    infoModel.desc = @"2019款 13寸";
    infoModel.category_id = 1;
    infoModel.original_price = 50;
    infoModel.price = 40;
    infoModel.count = 2;
    infoModel.avatar = (NSArray *)self.itemsArray;
    infoModel.third_url = @"www.baidu.com";
    infoModel.video_id = 1;
    [AddGoodsNetworking postAddGoods:infoModel completion:^(AddGoodsModel * _Nonnull model, NSError * _Nonnull error) {
        [AddGoodsNetworking postAddGoods:infoModel completion:^(AddGoodsModel * _Nonnull model, NSError * _Nonnull error) {
            NSLog(@"model.msg  =%@",model.msg);
            if ([model.msg isEqualToString:@"发布成功"]) {
                [self hideProgress];
                [self showSuccessMsg:@"发布成功"];
                //self.navigationController popViewControllerAnimated:
            }
        }];
    }];
}

- (void)setItemsArray:(NSArray *)itemsArray
{
    _itemsArray = itemsArray;
    
    for (UIButton *btn in [self.pictureView subviews]) {
        [btn removeFromSuperview];
    }
        if (itemsArray.count <= 3) {
            for (int i = 0; i < itemsArray.count; i++)
            {
                UIButton *btn = self.buttonArray[i];
                [self.pictureView addSubview:btn];
                btn.tag = 200+i;
                
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                    make.left.mas_equalTo(10+ 85*i);
                    make.size.mas_equalTo(CGSizeMake(75, 85));
                }];
                [btn setImage:self.itemsArray[i] forState:UIControlStateNormal];
                [btn addTarget:self
                        action:@selector(imageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                
                if (itemsArray.count - i == 1)
                {
                    [self.pictureView addSubview:self.addImageButton];
                    [self.addImageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                        make.left.equalTo(btn.mas_right).offset(10);
                        make.size.mas_equalTo(CGSizeMake(75, 85));
                    }];
                }
                [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.mas_equalTo(0);
                    make.top.equalTo(self.headView.mas_bottom).offset(10);
                    make.bottom.equalTo(self.submitButton.mas_bottom).offset(60);
                }];
    
                [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
                }];
            }
        }else if (itemsArray.count == 4)
        {
            for (int i = 0; i <= 3; i++)
            {
                UIButton *btn = self.buttonArray[i];
                [self.pictureView addSubview:btn];
                btn.tag = 200+i;
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.descTextField.mas_bottom).offset(50);
                    make.left.mas_equalTo(10+ 85*i);
                    make.size.mas_equalTo(CGSizeMake(75, 85));
                }];
                [btn setImage:itemsArray[i] forState:UIControlStateNormal];
                [btn addTarget:self
                        action:@selector(imageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                if (itemsArray.count - i == 1)
                {
                    [self.pictureView addSubview:self.addImageButton];
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
                [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.mas_equalTo(0);
                    make.top.equalTo(self.headView.mas_bottom).offset(10);
                    make.bottom.equalTo(self.submitButton.mas_bottom).offset(60);
                }];
    
                [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
                }];
          }
      }else if (itemsArray.count > 4 && itemsArray.count < 8)
      {
          for (int i = 0; i < 2; i++) {
              for (int j = 0; j < 4; j++) {
                  if ((4*i +j) > (itemsArray.count-1))
                  {
    
                  }else
                  {
                     UIButton *btn = self.buttonArray[4*i+j];
                      [self.pictureView addSubview:btn];
                      btn.tag = 200+i;
                      [btn addTarget:self
                              action:@selector(imageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                      [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                          make.top.equalTo(self.descTextField.mas_bottom).offset(50+ 95*i);
                          make.left.mas_equalTo(10+ 85*j);
                          make.size.mas_equalTo(CGSizeMake(75, 85));
                      }];
                      [btn setImage:itemsArray[4*i + j] forState:UIControlStateNormal];
                      if ( itemsArray.count- (4*i + j) == 1)
                      {
                          [self.pictureView addSubview:self.addImageButton];
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
    
                      [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                          make.left.right.mas_equalTo(0);
                          make.top.equalTo(self.headView.mas_bottom).offset(10);
                          make.bottom.equalTo(self.submitButton.mas_bottom).offset(60);
                      }];
    
                      [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                          make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
                      }];
                  }
               }
            }
          }else if (itemsArray.count == 8)
          {
              for (int i = 0; i < 2; i++) {
                  for (int j = 0; j < 4; j++) {
                      UIButton *btn = self.buttonArray[4*i + j];
                      [self.pictureView addSubview:btn];
                      btn.tag = 200+i;
                      [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                          make.top.equalTo(self.descTextField.mas_bottom).offset(50+ 95*i);
                          make.left.mas_equalTo(10+ 85*j);
                          make.size.mas_equalTo(CGSizeMake(75, 85));
                      }];
                      [btn setImage:itemsArray[4*i + j] forState:UIControlStateNormal];
                  }
              }
              [self.pictureView addSubview:self.addImageButton];
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
              
              [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                  make.left.right.mas_equalTo(0);
                  make.top.equalTo(self.headView.mas_bottom).offset(10);
                  make.bottom.equalTo(self.submitButton.mas_bottom).offset(60);
              }];
              
              [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                  make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
              }];
          }
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

- (UIView *)typeButtonLineView
{
    if (!_typeButtonLineView) {
        _typeButtonLineView = [[UIView alloc]init];
        [_typeButtonLineView setBackgroundColor:[UIColor orangeColor]];
    }
    return _typeButtonLineView;
}

- (AddGoodsInfoView *)priceView
{
    if (!_priceView) {
        _priceView = [[AddGoodsInfoView alloc]initWithFrame:CGRectZero AndWithViewType:infoViewControllerType];
        _priceView.titleLabel.text = @"价格";
        _priceView.infoTextField.keyboardType = UIKeyboardTypeDecimalPad;
    }
    return _priceView;
}

- (AddGoodsInfoView *)countView
{
    if (!_countView) {
        _countView = [[AddGoodsInfoView alloc]initWithFrame:CGRectZero AndWithViewType:infoViewControllerType];
         _countView.titleLabel.text = @"库存";
         _countView.infoTextField.keyboardType = UIKeyboardTypeDecimalPad;
    }
    return _countView;
}

- (AddGoodsInfoView *)typeView
{
    if (!_typeView) {
        _typeView = [[AddGoodsInfoView alloc]initWithFrame:CGRectZero AndWithViewType:pushViewControllerType];
         _typeView.titleLabel.text = @"分类";
    }
    return _typeView;
}

- (AddGoodsInfoView *)videoView
{
    if (!_videoView) {
        _videoView = [[AddGoodsInfoView alloc]initWithFrame:CGRectZero AndWithViewType:pushViewControllerType];
         _videoView.titleLabel.text = @"视频展示";
    }
    return _videoView;
}

- (UIButton *)submitButton
{
    if (!_submitButton) {
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitButton setBackgroundColor:[UIColor orangeColor]];
        [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitButton setTitle:@"确认发布" forState:UIControlStateNormal];
        [_submitButton.titleLabel setFont:kFontSize(18)];
        [_submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}

//---------------------------
- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
- (UIButton *)firstButton
{
    if (!_firstButton) {
        _firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _firstButton;
}
- (UIButton *)secondButton
{
    if (!_secondButton) {
        _secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _secondButton;
}
- (UIButton *)thirdButton
{
    if (!_thirdButton) {
        _thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _thirdButton;
}
- (UIButton *)fourthButton
{
    if (!_fourthButton) {
        _fourthButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _fourthButton;
}
- (UIButton *)fifthButton
{
    if (!_fifthButton) {
        _fifthButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _fifthButton;
}
- (UIButton *)sixthButton
{
    if (!_sixthButton) {
        _sixthButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _sixthButton;
}
- (UIButton *)seventhButton
{
    if (!_seventhButton) {
        _seventhButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _seventhButton;
}
- (UIButton *)eighthButton
{
    if (!_eighthButton) {
        _eighthButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _eighthButton;
}

@end

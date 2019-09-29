//
//  MyBusinessViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"

typedef enum{
    buyType = 1,
    sellTyle
}VCType;

typedef enum{
    sonVC = 1,
    pushVC = 2
}VCStatus;


NS_ASSUME_NONNULL_BEGIN

@interface MyBusinessViewController : BaseViewController
@property (strong, nonatomic)UITableView *tableView;
@property (assign, nonatomic)VCType type;
@property (assign, nonatomic)VCStatus status;
@end

NS_ASSUME_NONNULL_END

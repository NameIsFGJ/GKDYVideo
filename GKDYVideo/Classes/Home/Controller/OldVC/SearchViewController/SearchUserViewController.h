//
//  SearchUserViewController.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchUserViewController : BaseViewController
@property (strong, nonatomic)NSMutableArray *itemArray;
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSString *searchContentString;
@end

NS_ASSUME_NONNULL_END

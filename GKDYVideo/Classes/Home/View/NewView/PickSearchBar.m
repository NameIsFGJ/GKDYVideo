//
//  PickSearchBar.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/27.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "PickSearchBar.h"
/*
 self.searchBar.placeholder = @"搜索你要找的内容";
 //self.searchBar.backgroundImage = [UIImage imageNamed:@"bg"];
 self.searchBar.textFieldSearchBar.backgroundColor = [UIColor clearColor];
 // self.searchBar.backgroundColor = [UIColor blueColor];
 self.searchBar.barTintColor = [UIColor whiteColor];
 self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
 self.searchBar.showsScopeBar = YES;
 self.searchBar.delegate = self;
 
 */
@implementation PickSearchBar

- (instancetype)init
{
    self = [super init];
    if (self)
    {   
        self.placeholder = @"搜索你要找的内容";
        self.barTintColor = [UIColor whiteColor];
        self.searchBarStyle = UISearchBarStyleMinimal;
        //[textField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
       // UITextField *textField = [self valueForKey:@"_searchField"];
       // [textField setValue:[UIFont systemFontOfSize:15] forKey:@"_placeholderLabel.font"];
        
    }
    return self;
}
@end

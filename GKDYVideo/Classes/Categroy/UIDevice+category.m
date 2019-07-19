//
//  UIDevice+category.m
//  FGJ_project
//
//  Created by fgj on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIDevice+category.h"
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <AdSupport/AdSupport.h>

@implementation UIDevice (category)
- (NSString *)zx_idfaString
{
    NSBundle *adSupportBundle = [NSBundle bundleWithPath:@"/System/Library/Frameworks/AdSupport.framework"];
    [adSupportBundle load];
    
    if (adSupportBundle == nil)
    {
        return @"";
    }
    else
    {
        Class asIdentifierMClass = NSClassFromString(@"ASIdentifierManager");
        
        if(asIdentifierMClass == nil){
            return @"";
        }
        else
        {
            ASIdentifierManager *asIM = [[asIdentifierMClass alloc] init];
            
            if (asIM == nil) {
                return @"";
            }
            else{
                
                if(asIM.advertisingTrackingEnabled)
                {
                    return [asIM.advertisingIdentifier UUIDString];
                }
                else
                {
                    return [asIM.advertisingIdentifier UUIDString];
                }
            }
        }
    }
}

@end

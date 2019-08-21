//
//  UILabel+fontHeight.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/20.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UILabel+fontHeight.h"

@implementation UILabel (fontHeight)
- (CGFloat)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize.height;
}
@end

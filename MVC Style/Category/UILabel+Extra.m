//
//  UILabel+Extra.m
//  MVC Style
//
//  Created by i-Phone6 on 25/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "UILabel+Extra.h"

@implementation UILabel (Extra)

-(void)setLabelLoginStyleWithText:(NSString *)strLbl withFont:(UIFont *)fontLbl withTextColor:(UIColor *)colorLbl
{
    [self setText:[strLbl capitalizedString]];
    [self setTextAlignment:NSTextAlignmentLeft];
    [self setTextColor:colorLbl];
    [self setFont:fontLbl];
}
-(void)addBottomLayerWithColor:(UIColor *)colorBottomBorder
{
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.frame.size.height - 1, self.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [colorBottomBorder colorWithAlphaComponent:0.4].CGColor;
    [self.layer addSublayer:bottomBorder];
}

@end

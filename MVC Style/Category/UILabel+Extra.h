//
//  UILabel+Extra.h
//  MVC Style
//
//  Created by i-Phone6 on 25/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface UILabel (Extra)

// Generate Lbl as per App Theme
-(void)setLabelLoginStyleWithText:(NSString *)strLbl withFont:(UIFont *)fontLbl withTextColor:(UIColor *)colorLbl;

// Add Bottom border as per App Theme
-(void)addBottomLayerWithColor:(UIColor *)colorBottomBorder;

@end

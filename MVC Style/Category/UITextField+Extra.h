//
//  UITextField+Extra.h
//  MVC Style
//
//  Created by i-Phone6 on 23/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface UITextField (Extra)

// Add theme to textfied
-(void)setTextfiledLoginStyleWithPlaceholder:(NSString *)strPlaceholder;
// Add Password Visibility Button
-(void)addPasswordVisibalButtonOnTarget:(nullable id)target Action:(SEL)btnAction;
// To Add Bottom border
-(void)addBottomLayerWithColor:(UIColor *)colorBottomBorder;

@end

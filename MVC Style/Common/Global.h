//
//  Global.h
//  MVC Style
//
//  Created by i-Phone6 on 24/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "User.h"

@interface Global : NSObject

// Show Alert
+(void)setAlertWithTitle:(NSString *)strTitle WithMessage:(NSString *)strMsg OnClass:(id)classObj;

// Get string height for applied font and applied width
+(float)getHeightForStringWithFont:(UIFont *)font string:(NSString *)stringMessage labelWidth:(CGFloat)lblWidth;

// Get Dictionary that contains all the keys of User Model
+(NSDictionary *)getUserModelEmptyDictionary;
@end

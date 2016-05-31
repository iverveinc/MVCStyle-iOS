//
//  Validation.h
//  MVC Style
//
//  Created by i-Phone6 on 23/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject

+ (BOOL) isValidEmail:(NSString *)strEmail;
+ (BOOL) isValidStringLength:(NSString *)strData;
+ (BOOL) isvalidPhoneNumber:(NSString *)strPhoneNo;

@end

//
//  Validation.m
//  MVC Style
//
//  Created by i-Phone6 on 23/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "Validation.h"

@implementation Validation


+ (BOOL) isValidEmail:(NSString *)strEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:strEmail];
}

+ (BOOL) isValidStringLength:(NSString *)strData
{
    return !([strData length] <= 0);
}

+ (BOOL) isvalidPhoneNumber:(NSString *)strPhoneNo
{
    NSString *phoneRegex = @"^[+]?[0-9]*$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:strPhoneNo];
}
@end

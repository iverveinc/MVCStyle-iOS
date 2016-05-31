//
//  Global.m
//  MVC Style
//
//  Created by i-Phone6 on 24/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "Global.h"

@implementation Global


+(void)setAlertWithTitle:(NSString *)strTitle WithMessage:(NSString *)strMsg OnClass:(id)classObj
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:strTitle
                                          message:strMsg
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   return;
                               }];
    
    [alertController addAction:okAction];
    [classObj presentViewController:alertController animated:YES completion:nil];
}


+(float)getHeightForStringWithFont:(UIFont *)font string:(NSString *)stringMessage labelWidth:(CGFloat)lblWidth
{
    CGSize maximumLabelSize = CGSizeMake(lblWidth, FLT_MAX);
    
    //    // for iOS 7
    CGRect textRect = [stringMessage boundingRectWithSize:maximumLabelSize
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:font}
                                                  context:nil];
    return textRect.size.height;
}

+(NSDictionary *)getUserModelEmptyDictionary
{
    NSArray *arrKeys = [User getAllKeys];
    NSMutableDictionary *dictData = [[NSMutableDictionary alloc]initWithObjects:arrKeys forKeys:arrKeys];
    for (NSString *strKey in [dictData allKeys]) {
        [dictData setObject:[NSNull null] forKey:strKey];
    }
    arrKeys = nil;
    return [dictData copy];
}

@end

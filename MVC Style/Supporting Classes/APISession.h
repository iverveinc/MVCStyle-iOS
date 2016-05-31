//
//  APISession.h
//  MVC Style
//
//  Created by i-Phone6 on 24/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "AppDelegate.h"

@interface APISession : NSURLSession<NSURLSessionDelegate>

// API CALL by URL
+ (void)initWithURL:(NSURL *)urlAPI withParmas:(NSMutableDictionary *)dicAPI withCompletionHandlar:(void (^) (NSDictionary *dicResult, NSError *error, int status))completionBlock;
@end

//
//  APISession.m
//  MVC Style
//
//  Created by i-Phone6 on 24/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "APISession.h"

@implementation APISession

+ (void)initWithURL:(NSURL *)urlAPI withParmas:(NSMutableDictionary *)dicAPI withCompletionHandlar:(void (^) (NSDictionary *dicResult,
                                                                                                       NSError *error, int status))completionBlock
{
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlAPI
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:TIME_OUT_INTERVAL];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    
    if ([[dicAPI allKeys] containsObject:kProfileImageData])
    {
        if ([dicAPI[kProfileImageData] isKindOfClass:[UIImage class]]) {
            
            NSData *dataImage = UIImageJPEGRepresentation([dicAPI objectForKey:kProfileImageData], 1.0f);
            if(dataImage){
                [dicAPI setObject:[dataImage base64EncodedStringWithOptions:0] forKey:kProfileImage];
                [dicAPI setValue:nil forKey:kProfileImageData];
            }
            else{
                [dicAPI setObject:@"" forKey:kProfileImage];
                [dicAPI setValue:nil forKey:kProfileImageData];
            }
        }
        else
        {
            [dicAPI setObject:@"" forKey:kProfileImage];
            [dicAPI setValue:nil forKey:kProfileImageData];
        }
    }
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:dicAPI options:0 error:&error];
    [request setHTTPBody:postData];
    
    NSString *strJsonFormat = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    
    
//    NSLog(@"API URL: %@ \t API PARAMETERS :%@",urlAPI,strJsonFormat);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        if (error!=nil)
        {
            completionBlock(nil,error,0);
            [postDataTask suspend];
        }
        else
        {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (dic) {
                completionBlock(dic,error,[[dic valueForKey:kAPI_RESPONCE_STATUS] intValue]);
                [postDataTask suspend];
            }
            else
            {
                completionBlock(nil,error,0);
                [postDataTask suspend];

            }
            
        }
    }];
    
    [postDataTask resume];
}

@end

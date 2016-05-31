//
//  SharedManager.m
//  MVC Style
//
//  Created by i-Phone6 on 25/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "SharedManager.h"

static SharedManager *objSharedManager;

@implementation SharedManager
@synthesize loginUser = _loginUser;
@synthesize isNetAvailable = _isNetAvailable;

+(SharedManager *)sharedInstance
{
    if(objSharedManager == nil)
    {
        objSharedManager = [[SharedManager alloc] init];
        
        objSharedManager.loginUser = [[User alloc] init];
    }
    return objSharedManager;
}


@end

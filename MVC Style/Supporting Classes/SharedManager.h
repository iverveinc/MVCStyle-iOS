//
//  SharedManager.h
//  MVC Style
//
//  Created by i-Phone6 on 25/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface SharedManager : NSObject

+(SharedManager *)sharedInstance;

@property (retain, nonatomic) User *loginUser;
@property(assign,readwrite) BOOL isNetAvailable;
@end

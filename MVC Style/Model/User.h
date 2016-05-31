//
//  User.h
//  MVC Style
//
//  Created by i-Phone6 on 24/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property(retain,nonatomic) NSString *firstName,*lastName,*mobileNumber,*userName,*emailId,*password,*address,*deviceId,*deviceType,*profileImage;
@property (nonatomic,retain) UIImage *profileImageData;
@property (assign) int gender,userType;


-(id)initWithObject :(NSDictionary *)dicUserData;
-(NSMutableDictionary *)getDictionary;
-(void)printDescription;
+ (NSArray *)getAllKeys;

@end

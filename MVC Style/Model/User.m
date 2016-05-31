//
//  User.m
//  MVC Style
//
//  Created by i-Phone6 on 24/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "User.h"
#import "Constant.h"
#import <objc/runtime.h>


@implementation User


-(id)initWithObject :(NSDictionary *)dicUserData
{
    self = [[User alloc] init];
    if (self)
    {
        @try {
            
            [self setFirstName:([dicUserData valueForKey:kFirstName] != [NSNull null])?[dicUserData valueForKey:kFirstName]:@""];
            [self setLastName:([dicUserData valueForKey:kLastName] != [NSNull null])?[dicUserData valueForKey:kLastName]:@""];
            [self setMobileNumber:([dicUserData valueForKey:kMobileNumber] != [NSNull null])?[dicUserData valueForKey:kMobileNumber]:@""];
            [self setUserName:([dicUserData valueForKey:kUserName] != [NSNull null])?[dicUserData valueForKey:kUserName]:@""];
            [self setEmailId:([dicUserData valueForKey:kEmailId] != [NSNull null])?[dicUserData valueForKey:kEmailId]:@""];
            [self setPassword:([dicUserData valueForKey:kPassword] != [NSNull null])?[dicUserData valueForKey:kPassword]:@""];
            [self setAddress:([dicUserData valueForKey:kAddress] != [NSNull null])?[dicUserData valueForKey:kAddress]:@""];
            [self setDeviceId:([dicUserData valueForKey:kDeviceId] != [NSNull null])?[dicUserData valueForKey:kDeviceId]:@""];
            [self setDeviceType:([dicUserData valueForKey:kDeviceType] != [NSNull null])?[dicUserData valueForKey:kDeviceType]:@"1"];
            [self setProfileImage:([dicUserData valueForKey:kProfileImage] != [NSNull null])?[dicUserData valueForKey:kProfileImage]:@""];
            
            [self setGender:([dicUserData valueForKey:kGender] != [NSNull null])?[[dicUserData valueForKey:kGender] intValue]:Gender_Male];
            [self setUserType:([dicUserData valueForKey:kUserType] != [NSNull null])?[[dicUserData valueForKey:kUserType] intValue]:1];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception: %@",exception.description);
        }
        @finally {
        }
        
    }
    return self;
}

-(NSMutableDictionary *)getDictionary
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    for(NSString *key in [self allPropertyNames])
    {
        if ([[self valueForKey:key] isKindOfClass:[NSString class]]) {
            if (![[self valueForKey:key] isEqualToString:@""]) {
                [dic setValue:[self valueForKey:key] forKey:key];
            }
        }
        else
        {
            [dic setValue:[self valueForKey:key] forKey:key];
        }
    }
    return dic;
}



-(void)printDescription
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    for(NSString *key in [self allPropertyNames])
    {
        [dic setValue:[self valueForKey:key] forKey:key];
    }
    
    NSLog(@"\n========================= User ==============================\n");
    NSLog(@"%@",[dic description]);
    NSLog(@"\n=============================================================\n");
    
}

- (NSArray *)allPropertyNames
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}

+ (NSArray *)getAllKeys
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}



@end

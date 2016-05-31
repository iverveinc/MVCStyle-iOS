//
//  Constant.h
//  MVC Style
//
//  Created by i-Phone6 on 21/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

typedef enum {
    Gender_Male,
    Gender_Female
} Gender;

typedef enum : NSInteger {
    kImageRenderModeOriginal = 0,
    kImageRenderModeTemplate,
    kImageRenderModeAutomatic,
} ImageRenderMode;


#define APP_NAME                @"MVC Style"


#pragma mark
#pragma mark - Screen Size

#define IS_IPAD                  UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define SCREEN_WIDTH             [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT            [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS            [[UIScreen mainScreen] bounds]
#define HEIGHT_STATUS_BAR        20.0f


#pragma mark
#pragma mark - WEB API URL

#define API_URL                 [NSString stringWithFormat:@"http://192.168.1.70/RequestandReceiveApp/api/Values/"]

#define API_LoginUser           @"LoginUser"
#define API_RegisterUser        @"RegisterUser"

#define TIME_OUT_INTERVAL       30.0


#pragma mark
#pragma mark - System Information

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#pragma mark
#pragma mark - Storyboard ID Keys..

#define sbIdLogin                   @"sbLogin"
#define sbIdSignUp                  @"sbSignUp"
#define sbIdProfile                 @"sbProfile"
#define sbIdLocation                @"sbLocation"

#pragma mark
#pragma mark - Screen Names

#define SCREEN_SIGNUP               @"Sign Up"
#define SCREEN_ADDRESS              @"Address"


#pragma mark
#pragma mark - Model Keys

#define kFirstName                  @"firstName"
#define kLastName                   @"lastName"
#define kMobileNumber               @"mobileNumber"
#define kUserName                   @"userName"
#define kEmailId                    @"emailId"
#define kPassword                   @"password"
#define kAddress                    @"address"
#define kDeviceId                   @"deviceId"
#define kDeviceType                 @"deviceType"
#define kProfileImage               @"profileImage"
#define kProfileImageData           @"profileImageData"
#define kGender                     @"gender"
#define kUserType                   @"userType"


#define DEFAULT_DEVICE_ID           @"1234567890"



#pragma mark
#pragma mark - Fonts

#define UI_DEFAULT_FONT_LIGHT(_size)                [UIFont fontWithName:@"Roboto-Light" size:_size]
#define UI_DEFAULT_FONT_MEDIUM(_size)               [UIFont fontWithName:@"Roboto-Medium" size:_size]
#define UI_DEFAULT_FONT_REGULAR(_size)              [UIFont fontWithName:@"Roboto-Regular" size:_size]
#define UI_DEFAULT_FONT_THIN(_size)                 [UIFont fontWithName:@"Roboto-Thin" size:_size]


#pragma mark
#pragma mark - Alert Messages

#define kOk                                         @"OK"
#define kYes                                        @"Yes"
#define kNoThanks                                   @"No Thanks"
#define kCancel                                     @"Cancel"


#pragma mark
#pragma mark - Validation Message

#define kMessageEmail                               @"Enter Your Email address"
#define kMessageEmailValidation                     @"Invalid Email!"
#define kMessagePassword                            @"Enter Your Password!"
#define kMessageFirstName                           @"Enter Your First Name!"
#define kMessageLastName                            @"Enter Your Last Name!"
#define kMessageMobileNumber                        @"Please enter Mobile Number!"
#define kMessageMobileNumberValidation              @"Invalid Mobile Number!"
#define kMessageUserName                            @"Enter Your User Name!"
#define kMessageAddress                             @"Enter Your Address!"


#pragma mark
#pragma mark - Extra Message

#define kSOMETHING_WENT_WRONG                       @"Something went wrong!! Please try again later."
#define kREQUEST_TIME_OUT                           @"Request time out!\nPlease try agin later."
#define kCHECK_INTERNET                             @"Internet is not Available. Try again later!"

#define kAPI_RESPONCE_MSG                           @"message"
#define kAPI_RESPONCE_STATUS                        @"status"
#define kAPI_RESPONCE_USER_DETAIL                   @"userDetail"


#pragma mark
#pragma mark - Color

#define GET_COLOR_WITH_RGB(r,g,b,a)                 [UIColor colorWithRed:r/255.0f green:g/255.0 blue:b/255.0f alpha:a]
#define UI_COLOR_APP_THEME                          GET_COLOR_WITH_RGB(225,72,83,1)
#define UI_COLOR_Placeholder                        [UIColor lightGrayColor]
#define UI_COLOR_TEXT                               [UIColor grayColor]


#pragma mark
#pragma mark - Image

#define USE_IMAGE(imageName)                        [UIImage imageNamed:imageName]


#pragma mark
#pragma mark - File Store

#define DOC_DIR                                     [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) objectAtIndex:0]
#define FILE_SHARED_DIRECTORY                       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0]


#pragma mark
#pragma mark - Extra Usefull Constants

#define SharedObject                                [SharedManager sharedInstance]
#define RAND_FROM_TO(min, max)                      (min + arc4random_uniform(max - min + 1))
#define IMAGE_WITH_NAME_AND_RENDER_MODE(imgName, ImageRenderMode)         [[UIImage imageNamed:imgName] imageWithRenderingMode:ImageRenderMode == kImageRenderModeOriginal ? UIImageRenderingModeAlwaysOriginal : (ImageRenderMode == kImageRenderModeTemplate ? UIImageRenderingModeAlwaysTemplate : UIImageRenderingModeAutomatic)]
#define xMargin                                      20.0f


#pragma mark - Alert
#define MY_ALERT(Title,Msg,Delegate)        [[[UIAlertView alloc] initWithTitle:Title message:Msg delegate:Delegate cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show]



#endif /* Constant_h */

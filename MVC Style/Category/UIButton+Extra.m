//
//  UIButton+Extra.m
//  MVC Style
//
//  Created by i-Phone6 on 23/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "UIButton+Extra.h"
#import "Constant.h"

@implementation UIButton (Extra)

-(void)setButtonLoginStyle
{
    [self setTitleColor:UI_COLOR_APP_THEME forState:UIControlStateNormal];
    [self setTitleColor:UI_COLOR_APP_THEME forState:UIControlStateSelected];
    [[self titleLabel] setFont:UI_DEFAULT_FONT_REGULAR(15.0f)];
    [[self layer] setBorderColor:[UI_COLOR_APP_THEME colorWithAlphaComponent:0.4].CGColor];
    [[self layer] setBorderWidth:1.0f];
    [[self layer] setCornerRadius:(self.frame.size.height/2.0f)];
}

-(void)setRadioButtonStyleWithTitle:(NSString *)strBtnTitle
{
    [self setImage:USE_IMAGE(@"icon_radio_normal") forState:UIControlStateNormal];
    [self setImage:USE_IMAGE(@"icon_radio_selected") forState:UIControlStateSelected];
    [self.titleLabel setFont:UI_DEFAULT_FONT_REGULAR(10.0f)];
    [self setTitle:[NSString stringWithFormat:@" %@",strBtnTitle] forState:UIControlStateNormal];
    [self setTitleColor:UI_COLOR_Placeholder forState:UIControlStateNormal];
    [self setTitleColor:UI_COLOR_APP_THEME forState:UIControlStateSelected];
}

-(void)setProfilePictureStyle
{
    [self setImage:USE_IMAGE(@"img_profilepic_placeholder") forState:UIControlStateNormal];
    [self.layer setCornerRadius:self.frame.size.height/2.0f];
    [self.layer setBorderColor:[UI_COLOR_APP_THEME colorWithAlphaComponent:0.4].CGColor];
    [self.layer setBorderWidth:1.0f];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setContentMode:UIViewContentModeScaleAspectFill];
    [self.layer setMasksToBounds:YES];
}

-(void)setProfileImage
{
    if (SharedObject.loginUser.profileImageData) {
        [self setImage:SharedObject.loginUser.profileImageData forState:UIControlStateNormal];
    }
    else
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSData *imgDataForProfilePic = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:SharedObject.loginUser.profileImage]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if([imgDataForProfilePic length] > 0)
                {
                    UIImage *imageProfile = [UIImage imageWithData:imgDataForProfilePic];
                    [SharedObject.loginUser setProfileImageData:imageProfile];
                    [self setImage:SharedObject.loginUser.profileImageData forState:UIControlStateNormal];
                }
                
            });
        });
    }
}

@end

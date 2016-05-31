//
//  UITextField+Extra.m
//  MVC Style
//
//  Created by i-Phone6 on 23/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "UITextField+Extra.h"


@implementation UITextField (Extra)


-(void)setTextfiledLoginStyleWithPlaceholder:(NSString *)strPlaceholder
{
    [self setPlaceholder:strPlaceholder];
    [self setFont:UI_DEFAULT_FONT_REGULAR(13.0f)];
    [self setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self setTextColor:UI_COLOR_TEXT];
    [self setTintColor:UI_COLOR_APP_THEME];
    [self setValue:UI_COLOR_Placeholder forKeyPath:@"_placeholderLabel.textColor"];
}

-(void)addPasswordVisibalButtonOnTarget:(nullable id)target Action:(SEL)btnAction
{
    UIButton *btnShowPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnShowPassword setFrame:CGRectMake(0, 0, 20, 20)];
    [btnShowPassword setTintColor:UI_COLOR_Placeholder];
    [btnShowPassword setImage:IMAGE_WITH_NAME_AND_RENDER_MODE(@"icon_password_visibility", kImageRenderModeTemplate) forState:UIControlStateNormal];
    [btnShowPassword setBackgroundColor:[UIColor clearColor]];
    [btnShowPassword addTarget:target action:btnAction forControlEvents:UIControlEventTouchUpInside];
    [self setRightView:btnShowPassword];
    [self setRightViewMode:UITextFieldViewModeAlways];
}

-(void)addBottomLayerWithColor:(UIColor *)colorBottomBorder
{
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.frame.size.height - 1, self.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [colorBottomBorder colorWithAlphaComponent:0.4].CGColor;
    [self.layer addSublayer:bottomBorder];
}

@end

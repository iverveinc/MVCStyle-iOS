//
//  Login.h
//  MVC Style
//
//  Created by i-Phone6 on 21/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APISession.h"
#import "Validation.h"
#import "Global.h"
#import "User.h"

#import "SignUp.h"
#import "Profile.h"

@interface Login : UITableViewController<UITextFieldDelegate>
{
    User *userObjGlobal;
}

@end

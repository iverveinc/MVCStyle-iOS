//
//  Login.m
//  MVC Style
//
//  Created by i-Phone6 on 21/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "Login.h"
#import "Constant.h"
#import "UITextField+Extra.h"
#import "UIButton+Extra.h"



#define HEIGHT_CELL_EXTRA       100.0f
#define HEIGHT_CELL_Username    50.0f
#define HEIGHT_CELL_PASSWORD    50.0f
#define HEIGHT_CELL_BTN_SIGNIN  100.0f
#define HEIGHT_CELL_BTN_SIGNUP  (SCREEN_HEIGHT-(HEIGHT_STATUS_BAR+HEIGHT_CELL_EXTRA+HEIGHT_CELL_Username+HEIGHT_CELL_PASSWORD+HEIGHT_CELL_BTN_SIGNIN))

@interface Login ()
{
    UIButton *btnSignUp;
    NSInteger randomNumber;
}
@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    // To Generate Default View
    userObjGlobal = [[User alloc]initWithObject:[Global getUserModelEmptyDictionary]];
    SharedObject.loginUser = userObjGlobal;
    randomNumber  = RAND_FROM_TO(1, 1000);
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell_%ld_%ld_%ld",(long)indexPath.row,(long)indexPath.section,randomNumber];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        
        float xPos  = xMargin;
        float xx    = (SCREEN_WIDTH - (xPos*2));
        float yPos  = 20.0f;
        float yy    = 30.0f;
        
        switch (indexPath.row) {
            case 1:
            {
                UITextField *txtFldUsername  =[[UITextField alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
                [txtFldUsername setTextfiledLoginStyleWithPlaceholder:@"User Name"];
                [txtFldUsername addBottomLayerWithColor:UI_COLOR_APP_THEME];
                [txtFldUsername setText:userObjGlobal.userName];
                [txtFldUsername setDelegate:self];
                [txtFldUsername setTag:indexPath.row];
                [cell addSubview:txtFldUsername];
            }
                break;
            case 2:
            {
                UITextField *txtFldPassword  =[[UITextField alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
                [txtFldPassword setTextfiledLoginStyleWithPlaceholder:@"Password"];
                [txtFldPassword addBottomLayerWithColor:UI_COLOR_APP_THEME];
                [txtFldPassword setText:userObjGlobal.password];
                [txtFldPassword setSecureTextEntry:YES];
                [txtFldPassword setDelegate:self];
                [txtFldPassword setTag:indexPath.row];
                [txtFldPassword addPasswordVisibalButtonOnTarget:self Action:@selector(btnShowPasswordClicked:)];
                [cell addSubview:txtFldPassword];
                
            }
                break;
            case 3:
            {
                xPos  = xMargin*2;
                xx    = (SCREEN_WIDTH - (xPos*2));
                yPos  = 30.0f;
                yy    = 40.0f;
                
                UIButton *btnSignIn = [[UIButton alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
                [btnSignIn addTarget:self action:@selector(btnSignInClicked:) forControlEvents:UIControlEventTouchUpInside];
                [btnSignIn setTitle:@"Sign In" forState:UIControlStateNormal];
                [btnSignIn setTitle:@"Signing In..." forState:UIControlStateSelected];
                [btnSignIn setSelected:NO];
                [btnSignIn setTag:indexPath.row];
                [btnSignIn setButtonLoginStyle];
                [cell addSubview:btnSignIn];
            }
                break;
            case 4:
            {
                xPos  = xMargin*2;
                xx    = (SCREEN_WIDTH - (xPos*2));
                yy    = 40.0f;
                yPos  = HEIGHT_CELL_BTN_SIGNUP - 30.0f - yy;
                
                btnSignUp = [[UIButton alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
                [btnSignUp addTarget:self action:@selector(btnSignUpClicked:) forControlEvents:UIControlEventTouchUpInside];
                [btnSignUp setTitle:@"Sign Up" forState:UIControlStateNormal];
                [btnSignUp setSelected:NO];
                [btnSignUp setTag:indexPath.row];
                [btnSignUp setButtonLoginStyle];
                [cell addSubview:btnSignUp];
            }
                break;
            default:
                break;
        }
        
    }
//    cell.backgroundColor = (indexPath.row %2 ==0)?[UIColor blueColor]:[UIColor greenColor];
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat heightRow = 0.0f;

    switch (indexPath.row) {
        case 0:
            heightRow = HEIGHT_CELL_EXTRA;
            break;
        case 1:
            heightRow = HEIGHT_CELL_Username;
            break;
        case 2:
            heightRow = HEIGHT_CELL_PASSWORD;
            break;
        case 3:
            heightRow = HEIGHT_CELL_BTN_SIGNIN;
            break;
        case 4:
            heightRow = HEIGHT_CELL_BTN_SIGNUP;
            break;
        default:
            break;
    }
    
    return heightRow;
}

#pragma mark
#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 1) {
        [userObjGlobal setUserName:textField.text];
    }
    else if (textField.tag == 2) {
        [userObjGlobal setPassword:textField.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark
#pragma mark - Button Click Action

-(IBAction)btnSignInClicked:(UIButton *)sender
{
    [self.view endEditing:YES];
    
    if (SharedObject.isNetAvailable) {
        if (![Validation isValidStringLength:userObjGlobal.userName]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageUserName OnClass:self];
            return;
        }
        
        
        if (![Validation isValidStringLength:userObjGlobal.password]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessagePassword OnClass:self];
            return;
        }
        
        [sender setSelected:YES];
        [sender setUserInteractionEnabled:NO];
        [btnSignUp setUserInteractionEnabled:NO];
        
        [userObjGlobal setDeviceId:DEFAULT_DEVICE_ID];
        
        NSString *strUrlAPI = [API_URL stringByAppendingString:API_LoginUser];
        
        NSMutableDictionary *dictAPI = [userObjGlobal getDictionary]; // Generate API Parameter from Model
        [dictAPI setValue:nil forKey:kGender]; // Remove Unnecessary Object to be passed in WebApi
        
        [APISession initWithURL:[NSURL URLWithString:strUrlAPI] withParmas:dictAPI withCompletionHandlar:^(NSDictionary *dicResult, NSError *error, int status) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setSelected:NO];
                [sender setUserInteractionEnabled:YES];
                [btnSignUp setUserInteractionEnabled:YES];
                
                if (status == 1)
                {
                    userObjGlobal = [[User alloc]initWithObject:[dicResult valueForKey:kAPI_RESPONCE_USER_DETAIL]];
                    SharedObject.loginUser = userObjGlobal;
                    
                    // Move to Home Page..
                    
                    Profile *objProfile = [self.storyboard instantiateViewControllerWithIdentifier:sbIdProfile];
                    [self.navigationController pushViewController:objProfile animated:YES];
                }
                else{
                    if (dicResult) {
                        [Global setAlertWithTitle:APP_NAME WithMessage:[dicResult valueForKey:kAPI_RESPONCE_MSG] OnClass:self];
                    }
                    else{
                        [Global setAlertWithTitle:APP_NAME WithMessage:kSOMETHING_WENT_WRONG OnClass:self];
                    }
                    
                }
                
            });
        }];

    }
    else
    {
        [Global setAlertWithTitle:APP_NAME WithMessage:kCHECK_INTERNET OnClass:self];
    }
    
    
}


-(IBAction)btnSignUpClicked:(UIButton *)sender
{
    SignUp *objSignUp = [self.storyboard instantiateViewControllerWithIdentifier:sbIdSignUp];
    [self.navigationController pushViewController:objSignUp animated:YES];
}


-(IBAction)btnShowPasswordClicked:(UIButton *)sender
{
    [sender setSelected:![sender isSelected]];
    
    UITextField *txtFld = (UITextField *)sender.superview; // grab the textfield from visibility button..
    [txtFld setSecureTextEntry:![sender isSelected]];
    
    [txtFld becomeFirstResponder]; // To move cursor on perfect position
    
}


@end

//
//  SignUp.m
//  MVC Style
//
//  Created by i-Phone6 on 21/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "SignUp.h"
#import "Constant.h"
#import "UITextField+Extra.h"
#import "UIButton+Extra.h"

#define PLACEHOLDER_ADDRESS         @"Address"
#define MIN_MOBILE_NO               10
#define MAX_MOBILE_NO               15


typedef enum {
    CELL_FIRST_NAME,
    CELL_LAST_NAME,
    CELL_MOBILE,
    CELL_USERNAME,
    CELL_EMAIL,
    CELL_PASSWORD,
    CELL_GENDER,
    CELL_ADDRESS,
    CELL_SUBMIT_BTN
} CELL;



@interface SignUp ()
{
    NSMutableArray *arrPlaceholder;
    UIToolbar *toolBar;
    UIButton *btnProfilePic;
}

@end

@implementation SignUp

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:SCREEN_SIGNUP];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    
    [self.tableView setTableHeaderView:[self getTableViewHeader]]; // get profilePicView
    
    
    arrPlaceholder = [[NSMutableArray alloc] initWithObjects: @"First Name",@"Last Name",@"Mobile",@"User Name",@"Email",@"Password",@"Gender",@"Address",@"Submit", nil];
    
    toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)]; //toolbar is uitoolbar object
    toolBar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem *btnDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(btnClickedDone:)];
    [toolBar setItems:[NSArray arrayWithObject:btnDone]];
    
    userObjGlobal = [[User alloc]initWithObject:[Global getUserModelEmptyDictionary]];
    [userObjGlobal setAddress:PLACEHOLDER_ADDRESS];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
    return [arrPlaceholder count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell_%ld_%ld",(long)indexPath.row,(long)indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        float xPos  = xMargin;
        float xx    = (SCREEN_WIDTH - (xPos*2));
        float yPos  = 15.0f;
        float yy    = 30.0f;
        
        
        if (indexPath.row < 6) {
            UITextField *txtFldUserData  =[[UITextField alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
            [txtFldUserData setTextfiledLoginStyleWithPlaceholder:[NSString stringWithFormat:@"%@",[arrPlaceholder objectAtIndex:indexPath.row]]];
            [txtFldUserData addBottomLayerWithColor:UI_COLOR_APP_THEME];
            [txtFldUserData setDelegate:self];
            [txtFldUserData setTag:indexPath.row];
            [cell addSubview:txtFldUserData];
            
            if (indexPath.row == 2)
            {
                [txtFldUserData setKeyboardType:UIKeyboardTypeNumberPad];
                [txtFldUserData setInputAccessoryView:toolBar];
            }
            else if (indexPath.row == 4)
                [txtFldUserData setKeyboardType:UIKeyboardTypeEmailAddress];
            else if (indexPath.row == 5)
                [txtFldUserData setSecureTextEntry:YES];
        }
        else if (indexPath.row == 6) // Gender
        {
            xx =  80.0f;
            UILabel *lblGender = [[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
            [lblGender setText:[NSString stringWithFormat:@"%@",[arrPlaceholder objectAtIndex:indexPath.row]]];
            [lblGender setTextAlignment:NSTextAlignmentLeft];
            [lblGender setTextColor:UI_COLOR_TEXT];
            [lblGender setFont:UI_DEFAULT_FONT_REGULAR(13.0f)];
            [lblGender setBackgroundColor:[UIColor clearColor]];
            [cell addSubview:lblGender];
            
            
            xx = ((SCREEN_WIDTH - (xMargin*2)) - xx)/2.0f;
            xPos = xMargin + lblGender.frame.size.width;
            UIButton *btnGenderMale = [[UIButton alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
            [btnGenderMale setRadioButtonStyleWithTitle:@"Male"];
            [btnGenderMale addTarget:self action:@selector(btnGenderClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btnGenderMale setTag:Gender_Male];
            [btnGenderMale setSelected:(userObjGlobal.gender == Gender_Male)];
            [cell addSubview:btnGenderMale];
            
            
            xPos = xPos + xx;
            UIButton *btnGenderFemale = [[UIButton alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
            [btnGenderFemale setRadioButtonStyleWithTitle:@"Female"];
            [btnGenderFemale addTarget:self action:@selector(btnGenderClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btnGenderFemale setSelected:(userObjGlobal.gender == Gender_Female)];
            [btnGenderFemale setTag:Gender_Female];
            [cell addSubview:btnGenderFemale];
            
        }
        else if (indexPath.row == 7) // Address
        {
            yy = 75.0f;
            UITextView *txtVwAddress = [[UITextView alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
            [txtVwAddress setText:[NSString stringWithFormat:@"%@",[arrPlaceholder objectAtIndex:indexPath.row]]];
            [txtVwAddress setTextAlignment:NSTextAlignmentLeft];
            [txtVwAddress setTextColor:UI_COLOR_Placeholder];
            [txtVwAddress setFont:UI_DEFAULT_FONT_REGULAR(13.0f)];
            [txtVwAddress setDelegate:self];
            [txtVwAddress setTintColor:UI_COLOR_APP_THEME];
            [txtVwAddress setTag:indexPath.row];
            [txtVwAddress setText:[NSString stringWithFormat:@"%@",userObjGlobal.address]];
            [txtVwAddress setBackgroundColor:[UIColor clearColor]];
            [cell addSubview:txtVwAddress];
            
            // Add bottom layer as per app theme
            CALayer *bottomBorder = [CALayer layer];
            bottomBorder.frame = CGRectMake(xPos, (yPos + yy + 1), xx, 1.0f);
            bottomBorder.backgroundColor = [UI_COLOR_APP_THEME colorWithAlphaComponent:0.4].CGColor;
            [cell.layer addSublayer:bottomBorder];
        }
        else if (indexPath.row == 8) // Submit button
        {
            xPos  = xMargin*2;
            xx    = (SCREEN_WIDTH - (xPos*2));
            yPos  = 10.0f;
            yy    = 40.0f;
            
            UIButton *btnSubmit = [[UIButton alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
            [btnSubmit addTarget:self action:@selector(btnSubmitClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btnSubmit setTitle:@"Submit" forState:UIControlStateNormal];
            [btnSubmit setTitle:@"Submitting ..." forState:UIControlStateSelected];
            [btnSubmit setTag:indexPath.row];
            [btnSubmit setButtonLoginStyle];
            [cell addSubview:btnSubmit];
        }
        
    }
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

#pragma mark
#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == CELL_ADDRESS)
        return 100.0f;
    else if (indexPath.row == CELL_SUBMIT_BTN)
        return 80.0f;
    
    return 45.0f;
}

#pragma mark
#pragma mark - Tableview Header

-(UIView *)getTableViewHeader
{
    float xPos = 0.0f;
    float yPos = 0.0f;
    float xx   = SCREEN_WIDTH;
    float yy   = 100.0f;
    
    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
    [viewHeader setBackgroundColor:[UIColor clearColor]];
    
    
    xx   = 70.0f;
    yy   = xx;
    yPos = viewHeader.frame.size.height-yy;
    
    btnProfilePic = [[UIButton alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
    [btnProfilePic setCenter:CGPointMake(SCREEN_WIDTH/2.0f, btnProfilePic.center.y)];
    [btnProfilePic setProfilePictureStyle];
    [btnProfilePic addTarget:self action:@selector(btnProfilePicClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewHeader addSubview:btnProfilePic];
    
    
    
    return viewHeader;
}


#pragma mark
#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:PLACEHOLDER_ADDRESS]) {
        [textView setText:@""];
        [textView setTextColor:UI_COLOR_TEXT];
    }
    
    [textView setInputAccessoryView:toolBar];
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text length] ==0) {
        [textView setText:PLACEHOLDER_ADDRESS];
        [textView setTextColor:UI_COLOR_Placeholder];
    }
    else{
        [textView setTextColor:UI_COLOR_TEXT];
    }
    
    [userObjGlobal setAddress:textView.text];
}

#pragma mark
#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case CELL_FIRST_NAME:
        {
            [userObjGlobal setFirstName:textField.text];
        }
            break;
        case CELL_LAST_NAME:
        {
            [userObjGlobal setLastName:textField.text];
        }
            break;
        case CELL_MOBILE:
        {
            [userObjGlobal setMobileNumber:textField.text];
        }
            break;
        case CELL_USERNAME:
        {
            [userObjGlobal setUserName:textField.text];
        }
            break;
        case CELL_EMAIL:
        {
            [userObjGlobal setEmailId:textField.text];
        }
            break;
        case CELL_PASSWORD:
        {
            [userObjGlobal setPassword:textField.text];
        }
            break;
            
        default:
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark
#pragma mark - Button Click Action

-(IBAction)btnSubmitClicked:(UIButton *)sender
{
    [self.view endEditing:YES];
    
    if (SharedObject.isNetAvailable) {
        if (![Validation isValidStringLength:userObjGlobal.firstName]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageFirstName OnClass:self];
            return;
        }
        
        if (![Validation isValidStringLength:userObjGlobal.lastName]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageLastName OnClass:self];
            return;
        }
        
        
        if (![Validation isValidStringLength:userObjGlobal.mobileNumber]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageMobileNumber OnClass:self];
            return;
        }
        
        if (![Validation isvalidPhoneNumber:userObjGlobal.mobileNumber]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageMobileNumberValidation OnClass:self];
            return;
        }
        
        if (!(([userObjGlobal.mobileNumber length] >=MIN_MOBILE_NO) && ([userObjGlobal.mobileNumber length] <=MAX_MOBILE_NO))) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageMobileNumberValidation OnClass:self];
            return;
        }
        
        if (![Validation isValidStringLength:userObjGlobal.userName]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageUserName OnClass:self];
            return;
        }
        
        if (![Validation isValidStringLength:userObjGlobal.emailId]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageEmail OnClass:self];
            return;
        }
        
        if (![Validation isValidEmail:userObjGlobal.emailId]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageEmailValidation OnClass:self];
            return;
        }
        
        if (![Validation isValidStringLength:userObjGlobal.password]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessagePassword OnClass:self];
            return;
        }
        
        if ([userObjGlobal.address isEqualToString:PLACEHOLDER_ADDRESS]) {
            [Global setAlertWithTitle:APP_NAME WithMessage:kMessageAddress OnClass:self];
            return;
        }
        
        [sender setSelected:YES];
        [sender setUserInteractionEnabled:NO];
        
        NSMutableDictionary *dictAPI = [userObjGlobal getDictionary]; // Generate API Parameter from Model
        
        NSString *strUrlAPI = [API_URL stringByAppendingString:API_RegisterUser];
        
        [APISession initWithURL:[NSURL URLWithString:strUrlAPI] withParmas:dictAPI withCompletionHandlar:^(NSDictionary *dicResult, NSError *error, int status) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setSelected:NO];
                [sender setUserInteractionEnabled:YES];
                
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

-(IBAction)btnGenderClicked:(UIButton *)sender
{
    
    for (UIButton *btnObj in sender.superview.subviews) {
        
        if ([btnObj isKindOfClass:[UIButton class]]) {
            [btnObj setSelected:NO];
        }
    }
    [sender setSelected:YES];
    
    [userObjGlobal setGender:(int)sender.tag];
}


-(IBAction)btnClickedDone:(UIButton *)sender
{
    [self.view endEditing:YES];
}

-(IBAction)btnProfilePicClicked:(UIButton *)sender
{
    
    [self.view endEditing:YES];
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:APP_NAME message:@"Choose Profile Picture" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        // Open Camera for choose image
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *objImagePickerController =[[UIImagePickerController alloc]init];
            objImagePickerController.allowsEditing = YES;
            objImagePickerController.delegate = self;
            objImagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:objImagePickerController animated:YES completion:nil];
        }
        else
        {
            [Global setAlertWithTitle:APP_NAME WithMessage:@"Cemera Not Available!" OnClass:self];
        }
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        // Open gallery for choose image
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController *objImagePickerController =[[UIImagePickerController alloc]init];
            objImagePickerController.allowsEditing = YES;
            objImagePickerController.delegate = self;
            objImagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:objImagePickerController animated:YES completion:nil];
        }
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
}


#pragma mark
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [userObjGlobal setProfileImageData:image];
    
    [btnProfilePic setSelected:YES];
    [btnProfilePic setImage:userObjGlobal.profileImageData forState:UIControlStateSelected];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}



@end

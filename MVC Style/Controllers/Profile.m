//
//  Profile.m
//  MVC Style
//
//  Created by i-Phone6 on 21/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "Profile.h"
#import "Constant.h"
#import "UILabel+Extra.h"
#import "UIButton+Extra.h"

#import "Location.h"

typedef enum {
    CELL_FIRST_NAME,
    CELL_LAST_NAME,
    CELL_MOBILE,
    CELL_USERNAME,
    CELL_EMAIL,
    CELL_GENDER,
    CELL_ADDRESS,
    CELL_LOGOUT_BTN
} CELL;

@interface Profile ()
{
    NSMutableArray *arrUserDataTitle;
    NSMutableArray *arrUserData;
}

@end

@implementation Profile

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:[NSString stringWithFormat:@"%@",[SharedObject.loginUser.userName capitalizedString]]];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    
    [self.tableView setTableHeaderView:[self getTableViewHeader]]; // get profilePicView
    
    
    arrUserDataTitle = [[NSMutableArray alloc] initWithObjects: @"First Name",@"Last Name",@"Mobile",@"User Name",@"Email",@"Gender",@"Address",@"Log Out", nil];
    arrUserData = [[NSMutableArray alloc]initWithObjects:SharedObject.loginUser.firstName,SharedObject.loginUser.lastName,SharedObject.loginUser.mobileNumber,SharedObject.loginUser.userName,SharedObject.loginUser.emailId,[NSString stringWithFormat:@"%d",SharedObject.loginUser.gender],SharedObject.loginUser.address, nil];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
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
    return [arrUserDataTitle count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell_%ld_%ld",(long)indexPath.row,(long)indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        float xPos  = xMargin;
        float xx    = (SCREEN_WIDTH - (xPos*2));
        float yPos  = 10.0f;
        float yy    = 20.0f;
        
        
        if (indexPath.row < 7) {
            
            UILabel *lblDataTitle = [[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos, xx/2, yy)];
            [lblDataTitle setLabelLoginStyleWithText:[arrUserDataTitle objectAtIndex:indexPath.row] withFont:UI_DEFAULT_FONT_REGULAR(13.0f) withTextColor:UI_COLOR_APP_THEME];
            [lblDataTitle setBackgroundColor:[UIColor clearColor]];
            [cell addSubview:lblDataTitle];
            
            
            yPos = yPos + yy;
            yy   = 20.0f;
            
            if (indexPath.row == CELL_ADDRESS) {
                yy = [Global getHeightForStringWithFont:UI_DEFAULT_FONT_REGULAR(10.0f) string:[arrUserData objectAtIndex:indexPath.row] labelWidth:xx];
                if (yy<20.0f) {
                    yy = 20.0f;
                }
            }
            
            UILabel *lblDataUser = [[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
            [lblDataUser setLabelLoginStyleWithText:[arrUserData objectAtIndex:indexPath.row] withFont:UI_DEFAULT_FONT_REGULAR(10.0f) withTextColor:UI_COLOR_TEXT];
            [lblDataUser addBottomLayerWithColor:UI_COLOR_Placeholder];
            [lblDataUser setBackgroundColor:[UIColor clearColor]];
            if (indexPath.row == CELL_EMAIL)
                [lblDataUser setText:[[arrUserData objectAtIndex:indexPath.row] lowercaseString]];
            else if (indexPath.row == CELL_GENDER)
                [lblDataUser setText:([[arrUserData objectAtIndex:indexPath.row] intValue] == Gender_Male)?@"Male":@"Female"];
            else if (indexPath.row == CELL_ADDRESS)
            {
                [lblDataUser setNumberOfLines:0];
                [lblDataUser setLineBreakMode:NSLineBreakByWordWrapping];
                [lblDataUser sizeToFit];
            }
            
            [cell addSubview:lblDataUser];
            
        }
        else if (indexPath.row == 7) // Submit button
        {
            xPos  = xMargin*2;
            xx    = (SCREEN_WIDTH - (xPos*2));
            yPos  = 20.0f;
            yy    = 40.0f;
            
            UIButton *btnLogout = [[UIButton alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
            [btnLogout addTarget:self action:@selector(btnLogoutClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btnLogout setTitle:@"Log Out" forState:UIControlStateNormal];
            [btnLogout setTitle:@"Logging Out ..." forState:UIControlStateSelected];
            [btnLogout setTag:indexPath.row];
            [btnLogout setButtonLoginStyle];
            [cell addSubview:btnLogout];
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
    if (indexPath.row == CELL_LOGOUT_BTN) {
        return 90.0f;
    }
    else if (indexPath.row == CELL_ADDRESS)
    {
        float height = [Global getHeightForStringWithFont:UI_DEFAULT_FONT_REGULAR(10.0f) string:[arrUserData objectAtIndex:CELL_ADDRESS] labelWidth:(SCREEN_WIDTH - (xMargin*2))];
        if (height < 20.0f) {
            height = 20.0f;
        }
        return 30.0f + height;
    }
    
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == CELL_ADDRESS) {
        Location *objLocation = [self.storyboard instantiateViewControllerWithIdentifier:sbIdLocation];
        [self.navigationController pushViewController:objLocation animated:YES];
    }
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
    
    UIButton *btnProfilePic = [[UIButton alloc]initWithFrame:CGRectMake(xPos, yPos, xx, yy)];
    [btnProfilePic setCenter:CGPointMake(SCREEN_WIDTH/2.0f, btnProfilePic.center.y)];
    [btnProfilePic setProfilePictureStyle];
    [btnProfilePic setProfileImage];
    [viewHeader addSubview:btnProfilePic];
    
    
    return viewHeader;
}

#pragma mark
#pragma mark - Button Click Action

-(IBAction)btnLogoutClicked:(UIButton *)sender
{
    [sender setSelected:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

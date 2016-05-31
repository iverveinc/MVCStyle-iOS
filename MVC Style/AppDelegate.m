//
//  AppDelegate.m
//  MVC Style
//
//  Created by i-Phone6 on 21/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "AppDelegate.h"

#define HOST_URL            @"www.apple.com"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     
    
    // Set Navigation Bar
    [[UINavigationBar appearance] setBarTintColor:UI_COLOR_APP_THEME];  // Set Navigation bar color
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];  // Set Navigation bar item tint color
    
    // Set the navigation bar title color
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           UI_DEFAULT_FONT_MEDIUM(17.0f), NSFontAttributeName, nil]];
    
    
    // Hides the default back button title
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    self.hostReachability = [Reachability reachabilityWithHostName:HOST_URL];
    [self.hostReachability startNotifier];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark
#pragma mark - Rechability Notification

- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NetworkStatus remoteHostStatus = [curReach currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable)
    {
        SharedObject.isNetAvailable = NO;  // Internet not Connected
    }
    else if (remoteHostStatus == ReachableViaWiFi)
    {
        SharedObject.isNetAvailable = YES; // Connected via WIFI
    }
    else if (remoteHostStatus == ReachableViaWWAN)
    {
        SharedObject.isNetAvailable = YES; // Connected via WWAN
    }
}


@end

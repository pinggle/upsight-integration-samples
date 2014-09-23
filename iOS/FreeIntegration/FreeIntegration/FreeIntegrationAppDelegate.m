//
//  FreeIntegrationAppDelegate.m
//  FreeIntegration
//
//  Created by Polina Soshnin on 9/16/14.
//  Copyright (c) 2014 Upsight. All rights reserved.
//

#import "FreeIntegrationAppDelegate.h"
#import "FreeIntegrationViewController.h"


@implementation FreeIntegrationAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[PHPublisherOpenRequest requestForApp:@"e727ecc44825481e80175e68a63c1854" secret:@"3c1f5ee7d6d74873a2852c9035dd6b66" ] send];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    FreeIntegrationViewController *viewController = [[FreeIntegrationViewController alloc] initWithNibName:@"FreeIntegrationViewController" bundle:nil];
    self.window.rootViewController = viewController;
    
    [self.window makeKeyAndVisible];
    
    
    //CODE FOR PUSH
    
    [PHPushProvider sharedInstance].applicationToken = @"e727ecc44825481e80175e68a63c1854";
    [PHPushProvider sharedInstance].applicationSecret = @"3c1f5ee7d6d74873a2852c9035dd6b66";
    [PHPushProvider sharedInstance].delegate = self;
    
    self.remoteNotificationInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    [[PHPushProvider sharedInstance] registerForPushNotifications];
    
    //END CODE FOR PUSH
    
    return YES;
}

//method implementations for push

- (void)application:(UIApplication *)anApplication didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)aDeviceToken
{
    [[PHPushProvider sharedInstance] registerAPNSDeviceToken:aDeviceToken];
    if (self.remoteNotificationInfo)
    {
        [[PHPushProvider sharedInstance] handleRemoteNotificationWithUserInfo:self.remoteNotificationInfo];
        self.remoteNotificationInfo = nil;
    }
}

- (void)application:(UIApplication *)anApplication didFailToRegisterForRemoteNotificationsWithError:(NSError *)anError
{
    self.remoteNotificationInfo = nil;
    
    NSLog(@"Application failed to register for push notifications: %@", anError);
}

- (void)application:(UIApplication *)anApplication didReceiveRemoteNotification:(NSDictionary *)aUserInfo
{
    [[PHPushProvider sharedInstance] handleRemoteNotificationWithUserInfo:aUserInfo];
    NSLog(@"Did receive notification with user info: %@", aUserInfo);
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [[PHPushProvider sharedInstance] registerUserNotificationSettings:notificationSettings];
}


//Responding to Push-triggered content units

- (BOOL)pushProvider:(PHPushProvider *)aProvider shouldSendRequest:(PHPublisherContentRequest *)aRequest
{
    aRequest.delegate = self;
    return YES;
}

//end method implementations for push


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
     [[PHPublisherOpenRequest requestForApp:@"e727ecc44825481e80175e68a63c1854" secret:@"3c1f5ee7d6d74873a2852c9035dd6b66" ] send];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    PHPublisherContentRequest *request = [PHPublisherContentRequest requestForApp:@"e727ecc44825481e80175e68a63c1854" secret:@"3c1f5ee7d6d74873a2852c9035dd6b66" placement:@"app_launch" delegate:nil];
    [request send];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

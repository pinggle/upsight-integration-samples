//
//  FreeIntegrationAppDelegate.h
//  FreeIntegration
//
//  Created by Polina Soshnin on 9/16/14.
//  Copyright (c) 2014 Upsight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayHavenSDK.h"

@interface FreeIntegrationAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSDictionary *remoteNotificationInfo;

@end

//for PUSH
@interface PHPushProvider ()
@property (nonatomic, retain) NSData *APNSDeviceToken;
@end





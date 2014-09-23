//
//  FreeIntegrationViewController.m
//  FreeIntegration
//
//  Created by Polina Soshnin on 9/16/14.
//  Copyright (c) 2014 Upsight. All rights reserved.
//

#import "FreeIntegrationViewController.h"
#import "PlayHavenSDK.h"

@interface FreeIntegrationViewController ()

@end

@implementation FreeIntegrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)showMessage
{
    UIAlertView *helloWorldAlert = [[UIAlertView alloc]
                                    initWithTitle:@"Click Event" message:@"I just clicked a button" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [helloWorldAlert show];
    
    
    PHEvent *theEvent = [PHEvent eventWithProperties:@{@"inventory" : @{@"swords" :@{@"katanas" : @(3)}}}];
    PHEventRequest *theRequest = [PHEventRequest requestForApp:@"e727ecc44825481e80175e68a63c1854" secret:@"3c1f5ee7d6d74873a2852c9035dd6b66" event:theEvent];
    
    // Optionally assign a delegate to the request object to get notified when it succeeds/fails
    theRequest.delegate = self;
    
    [theRequest send];
    
    
}



@end

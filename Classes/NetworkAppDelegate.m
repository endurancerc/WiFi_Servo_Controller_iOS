//
//  NetworkAppDelegate.m
//  Network
//
//  Created by Nicole Cattron on 7/17/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "NetworkAppDelegate.h"
#import "NetworkViewController.h"

@implementation NetworkAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


//- (void)applicationWillResignActive:(UIApplication *)application {
//statusLabel.text = @"App was locked";
//   NSLog(@"asdfasdfa");//works
//}


@end

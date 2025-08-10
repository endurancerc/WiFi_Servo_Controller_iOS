//
//  NetworkAppDelegate.h
//  Network
//
//  Created by Nicole Cattron on 7/17/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NetworkViewController;

@interface NetworkAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NetworkViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NetworkViewController *viewController;

@end


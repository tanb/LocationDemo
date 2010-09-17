//
//  LocationDemoAppDelegate.h
//  LocationDemo
//
//  Created by tanB on 9/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocationDemoViewController;

@interface LocationDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LocationDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LocationDemoViewController *viewController;

@end


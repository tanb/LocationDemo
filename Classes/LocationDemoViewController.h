//
//  LocationDemoViewController.h
//  LocationDemo
//
//  Created by tanB on 9/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface LocationDemoViewController : UIViewController<CLLocationManagerDelegate> {
	IBOutlet UILabel *locationLabel;
	IBOutlet UISwitch *monitorSwitch;
	CLLocationManager *locationManager;
	CLRegion *region1; 
	CLRegion *region2; 
	CLRegion *region3; 
	
}
@property(nonatomic,retain)CLRegion *region1;
@property(nonatomic,retain)CLRegion *region2;
@property(nonatomic,retain)CLRegion *region3;

- (IBAction) monitorSwitch:(id)sender;
- (void)startMonitoring;
- (void)stopMonitoring;
@end


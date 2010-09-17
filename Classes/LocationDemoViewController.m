//
//  LocationDemoViewController.m
//  LocationDemo
//
//  Created by tanB on 9/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LocationDemoViewController.h"

@implementation LocationDemoViewController
@synthesize region1,region2,region3;


- (void)viewDidLoad { 	
	locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationLabel.text = @"let's start Monitoring";
	
	// 自宅
	CLLocationCoordinate2D coord;
	coord.latitude = 35.837818;
	coord.longitude = 139.908755;
	CLLocationDistance radius = 100; //単位はメートル
	self.region1 = [[[CLRegion alloc]initCircularRegionWithCenter:coord
														   radius:radius
													   identifier:@"hoge1"] autorelease];
	
	// 北千住
	coord.latitude = 35.757657;
	coord.longitude = 139.819136;
	self.region2 = [[[CLRegion alloc]initCircularRegionWithCenter:coord
														   radius:radius
													   identifier:@"hoge2"] autorelease];
	
	// 乃木坂
	coord.latitude = 35.757657;
	coord.longitude = 139.819136;
	self.region3 = [[[CLRegion alloc]initCircularRegionWithCenter:coord
														   radius:radius
													   identifier:@"hoge3"] autorelease];
}

- (IBAction) monitorSwitch:(id)sender{
	if ([sender isOn] == YES) {
		[self startMonitoring];
		[locationManager startUpdatingLocation];
	} else {
		locationLabel.text = @"stop Monitoring";
		[self stopMonitoring];
		[locationManager stopUpdatingLocation];
	}
}

- (void)startMonitoring{
	[locationManager startMonitoringForRegion:self.region1
							  desiredAccuracy:kCLLocationAccuracyHundredMeters];
	
	[locationManager startMonitoringForRegion:self.region2
							  desiredAccuracy:kCLLocationAccuracyHundredMeters];
	
	[locationManager startMonitoringForRegion:self.region3
							  desiredAccuracy:kCLLocationAccuracyHundredMeters];
		
}

- (void)stopMonitoring{
	[locationManager stopMonitoringForRegion:self.region1];
	[locationManager stopMonitoringForRegion:self.region2];
	[locationManager stopMonitoringForRegion:self.region3];
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	locationLabel.text = [newLocation description];
}

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
	locationLabel.text = [error description];
}

- (void)locationManager:(CLLocationManager *)manager
		 didEnterRegion:(CLRegion *)region
{
	NSString *urlString = @"foursquare://venues";
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[locationManager release];
    [super dealloc];
}

@end

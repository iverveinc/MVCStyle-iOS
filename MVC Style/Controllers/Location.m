//
//  Location.m
//  MVC Style
//
//  Created by i-Phone6 on 21/05/16.
//  Copyright © 2016 I-Verve. All rights reserved.
//

#import "Location.h"
#import <MapKit/MapKit.h>
#import "Constant.h"
#import "SharedManager.h"

@interface Location ()
{
    MKMapView *mapView;
}
@end

@implementation Location

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:SCREEN_ADDRESS];
    
    mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:mapView];
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showAnnotationforLocation:[self getLocationFromAddressString:SharedObject.loginUser.address]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark
#pragma mark - Get Location Coordinates from Address

-(CLLocationCoordinate2D) getLocationFromAddressString: (NSString*) addressStr {
    double latitude = 0, longitude = 0;
    NSString * esc_addr = [addressStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude=latitude;
    center.longitude = longitude;
    return center;
    
}

#pragma mark
#pragma mark - Show Annotation on map view

-(void)showAnnotationforLocation:(CLLocationCoordinate2D)location
{
    MKCoordinateSpan span = MKCoordinateSpanMake(0.002, 0.002);
    MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
    
    [mapView setRegion:[mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = location;
    point.title = [SharedObject.loginUser.userName capitalizedString];
    point.subtitle = [SharedObject.loginUser.address capitalizedString];
    
    [mapView addAnnotation:point];
}

@end

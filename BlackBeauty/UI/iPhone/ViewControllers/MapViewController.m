//
//  MapViewController.m
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithLocation:(Location*)locationToLayOut
{
    if(self = [super init])
    {
        locationToShow = [locationToLayOut retain];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = locationToShow.Latitude;
    newRegion.center.longitude = locationToShow.Longitude;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    [self.mapView setRegion:newRegion animated:YES];
    
    self.title = [NSString stringWithFormat:@"%@%@%@",locationToShow.city,@", ",locationToShow.state] ;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if(IsRunningTallPhone())
    [self.mapView setFrame:CGRectMake(0, 0, 320, 568)];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.mapView setDelegate:nil];
    self.mapView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Action Methods

-(void)prepareAnnotationView
{
    
    
    CLLocationCoordinate2D tempCoordinate = CLLocationCoordinate2DMake(locationToShow.Latitude, locationToShow.Longitude);
       
    BBStoreAnnotation* userLocationAnnotation = [[BBStoreAnnotation alloc] initWithLocation:tempCoordinate];
    userLocationAnnotation.title = locationToShow.name;
    [mapView removeAnnotation:userLocationAnnotation];
    [mapView addAnnotation:userLocationAnnotation];
    
    [userLocationAnnotation release];
    
}


#pragma mark Map View Delegate

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    
    [self prepareAnnotationView];
}


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    if([annotation isKindOfClass:[BBStoreAnnotation class]])
    {
        static NSString *BridgeAnnotationIdentifier = @"userAnnotationIdentifier";
        
        ////NSLog(@"annotation");
        
        MKPinAnnotationView *pinView =
        (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:BridgeAnnotationIdentifier];
        if (pinView == nil)
        {
            // if an existing pin view was not available, create one
            MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc]
                                                  initWithAnnotation:annotation reuseIdentifier:BridgeAnnotationIdentifier];
            
            customPinView.pinColor = MKPinAnnotationColorGreen;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: when the detail disclosure button is tapped, we respond to it via:
            //       calloutAccessoryControlTapped delegate method
            //
            // by using "calloutAccessoryControlTapped", it's a convenient way to find out which annotation was tapped
            //
            //            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            //            [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
            //            customPinView.rightCalloutAccessoryView = rightButton;
            
            return [customPinView autorelease];
        }
        
        else
        {
            pinView.annotation = annotation;
        }
        
        return pinView;
        
    }
    
    return nil;
    
}


@end

//
//  MapViewController.h
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BBStoreAnnotation.h"

@interface MapViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView* mapView;
    Location* locationToShow;
}

@property(nonatomic,retain)IBOutlet MKMapView* mapView;

-(id)initWithLocation:(Location*)locationToLayOut;

@end

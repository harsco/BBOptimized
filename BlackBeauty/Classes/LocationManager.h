//
//  LocationManager.h
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//Class which deals with all location related things like Geocoding,reverse Geo Coding interacting with Core Location etc..

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>
#import "Location.h"
#import "AppStorage.h"


//@protocol locationProtocol ;
@protocol locationSearchResultsProtocol;

@interface LocationManager : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    id<locationSearchResultsProtocol>delegate;
    
    Location* locationDesired;
    
    NSTimer* locationTimer;
    BOOL isLocationFixed;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic,retain) id<locationSearchResultsProtocol>delegate;


-(void)getResellersNearMYLocation;
-(void)getResellersNearThePlace:(NSString*)place;
-(void)doForwardGeoCodingOfPlace:(NSString*)place;
-(NSMutableArray*)getAllLocations;

@end


@protocol locationSearchResultsProtocol <NSObject>

-(void)didGetDesiredLocations:(NSMutableArray*)desiredLocationsArray nearLocation:(Location*)location;
-(void)didFailToGetDesiredLocations:(NSString*)error;

@end

//@protocol locationProtocol <NSObject>

//-(void)didFailToGetLocationOfUser:(NSString*)error;
//-(void)didGetDesiredLocations:(NSMutableArray*)desiredLocationsArray;

//@end
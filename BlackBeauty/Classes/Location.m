//
//  Location.m
//  BlackBeauty
//
//  Created by Mahi on 5/2/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "Location.h"

@implementation Location
@synthesize Latitude,Longitude,name,address,telephone,email,webSite,distanceFromInterestedLocation,streetAddress,city,state,zipCode,stateAndZip,officeHours,loadingHours;

-(void)dealloc
{
    [super dealloc];
    
    [name release];
    [address release];
    [telephone release];
    [email release];
    [webSite release];
   
}

@end

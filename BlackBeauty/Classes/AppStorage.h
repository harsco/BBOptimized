//
//  AppStorage.h
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

//Singleton Class which interacts with sqlite3
//Delegate for us to do all the DB tasks

#import <Foundation/Foundation.h>

#import <sqlite3.h>


@interface AppStorage : NSObject
{
    
}

+ (AppStorage *)getInstance;

-(NSMutableArray*)getAllLocations;
-(NSMutableArray*)getResellersNearMe:(Location*)userLocation;   //function which computes nearest locations
-(Location*)getHarscoLocation:(Location*)location;

@end

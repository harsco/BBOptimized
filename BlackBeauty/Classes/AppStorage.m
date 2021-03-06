//
//  AppStorage.m
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "AppStorage.h"

static sqlite3 *database = nil;

@implementation AppStorage

//singleton Instance
+ (AppStorage *)getInstance
{
    static AppStorage* instance;
    @synchronized(self)
    {
        if(!instance)
        {
            instance = [[AppStorage alloc] init];
            [instance initVars];
        }
    }
    
    
    if(instance)
        return instance;
    
    return nil;
}


//initializing the DB copying the prefilled DB to the application sandbox

-(BOOL)initVars
{
    
    //essentially checking and loading the database
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [[paths objectAtIndex:0] stringByAppendingPathComponent:LOCATIONSDB];
    
    
    //NSLog(@"AppStorage::initVars:db path is %@",documentsDir);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError* error;
    
    // Check if the sqlite db exists in the application path
	if(![fileManager fileExistsAtPath:documentsDir])
    {
        NSString *defaultAppPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:LOCATIONSDB];
        //NSLog(@"AppStorage::initVars:path is %@",defaultAppPath);
        
        if(! [fileManager copyItemAtPath:defaultAppPath toPath:documentsDir error:&error])
        {
            //NSLog(@"error is %@",[error localizedDescription]);
            return NO;
        }
    }
    
    
    if (sqlite3_open([documentsDir UTF8String], &database) == SQLITE_OK)
    {
        
        //NSLog(@"AppStorage::initVars: Successfully opened the Database");
        
        //prepare the function for calculating the distances
        
        sqlite3_create_function(database, "distance", 4, SQLITE_UTF8, NULL, &distanceFunc, NULL, NULL);
        
        
        return YES;
    }
	else
		return NO;
    
    
    return NO;
}



-(NSMutableArray*)getResellersNearMe:(Location*)userLocation
{
    
    NSString* sqlQuery = [[NSString alloc] initWithFormat:@"%@%@%f%@%f%@",@"select *,",@" distance (latitude, longitude,", userLocation.Latitude,@",", userLocation.Longitude,@") AS Distance FROM locations ORDER BY Distance LIMIT 0,4"];
    
    NSMutableArray* resultLocations = [[NSMutableArray alloc] init];
    
    
  //  //NSLog(@"query is %@",sqlQuery);
    
   
    
    sqlite3_stmt* statement = NULL;
    
    if(sqlite3_prepare(database, [sqlQuery UTF8String], -1, &statement, 0) != SQLITE_OK)
    {
        //NSLog(@"%s",sqlite3_errmsg(database));
        [sqlQuery release];
    }
    else
    {
        [sqlQuery release];
        while(sqlite3_step(statement) == SQLITE_ROW)
        {
            
            
            NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
            
            Location* locationObject = [[Location alloc] init];
        
            
            locationObject.name = [[[NSString alloc] initWithFormat:@"%s",(char *)sqlite3_column_text(statement, 0) ] autorelease];
            
            locationObject.address = [NSString stringWithFormat:@"%s%@%s%@%s",(char *)sqlite3_column_text(statement, 1),@",",(char *)sqlite3_column_text(statement, 2),@",",(char *)sqlite3_column_text(statement, 3)];
            
            locationObject.streetAddress = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 1)];
            locationObject.city =  [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 2)];
            locationObject.stateAndZip = [[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 3)] stringByReplacingOccurrencesOfString:@" " withString:@""];
            locationObject.state = [locationObject.stateAndZip stringByReplacingOccurrencesOfString:@"[0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ locationObject.stateAndZip length])];
            locationObject.zipCode = [locationObject.stateAndZip stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ locationObject.stateAndZip length])];
            
           // //NSLog(@"zip is %@",[locationObject.stateAndZip stringByReplacingOccurrencesOfString:@"[0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ locationObject.stateAndZip length])]);
            
            locationObject.telephone = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 4)];
            
            locationObject.Latitude = sqlite3_column_double(statement, 7);
            locationObject.Longitude = sqlite3_column_double(statement, 8);
            locationObject.weekdayHours = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 9)];
            
//            if([locationObject.weekdayHours isEqualToString:@"Hours Not Available"])
//            {
//                
//            }
            
            locationObject.saturdayHours = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 10)];
            locationObject.sundayHours = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 11)];
            
            
            locationObject.distanceFromInterestedLocation = sqlite3_column_double(statement, 12);
            
            
            
            
//            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 0)]);
//            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 1)]);
//            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 2)]);
//            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 3)]);
//            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 4)]);
//            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 5)]);
//            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 6)]);
//            //NSLog(@"%f",sqlite3_column_double(statement, 7));
//            //NSLog(@"%f",sqlite3_column_double(statement, 8));
//            //NSLog(@"%f",sqlite3_column_double(statement, 9));
            
            [resultLocations addObject:locationObject];
            
            [locationObject release];
            
            [pool release];
            
        }
    }
    
    
    sqlite3_finalize(statement);
    
    return [resultLocations autorelease];
    
}


-(Location*)getHarscoLocation:(Location*)location
{
    NSString* sqlQuery = [NSString stringWithFormat:@"%@%f%@%f%@",@"select * from harscolocations where latitude = '",location.Latitude,@"' and longitude='",location.Longitude,@"';"];
    
    //NSLog(@"query is %@",sqlQuery);
    
    Location* harscoLocation = nil;
    
    sqlite3_stmt* statement = NULL;
    
    if(sqlite3_prepare(database, [sqlQuery UTF8String], -1, &statement, 0) != SQLITE_OK)
    {
        //NSLog(@"%s",sqlite3_errmsg(database));
        [sqlQuery release];
    }
    else
    {
        
        while(sqlite3_step(statement) == SQLITE_ROW)
        {
            harscoLocation = [[Location alloc] init];
            harscoLocation.name = [[[NSString alloc] initWithFormat:@"%s",(char *)sqlite3_column_text(statement, 0) ] autorelease];
            
            harscoLocation.address = [NSString stringWithFormat:@"%s%@%s%@%s",(char *)sqlite3_column_text(statement, 1),@",",(char *)sqlite3_column_text(statement, 2),@",",(char *)sqlite3_column_text(statement, 3)];
            
            harscoLocation.streetAddress = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 1)];
            harscoLocation.city =  [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 2)];
            harscoLocation.stateAndZip = [[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 3)] stringByReplacingOccurrencesOfString:@" " withString:@""];
            harscoLocation.state = [harscoLocation.stateAndZip stringByReplacingOccurrencesOfString:@"[0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ harscoLocation.stateAndZip length])];
            harscoLocation.zipCode = [harscoLocation.stateAndZip stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ harscoLocation.stateAndZip length])];
            
            // //NSLog(@"zip is %@",[locationObject.stateAndZip stringByReplacingOccurrencesOfString:@"[0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ locationObject.stateAndZip length])]);
            
            harscoLocation.telephone = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 4)];
            harscoLocation.webSite = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 5)];
            
            harscoLocation.email = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 6)];
            
           
            harscoLocation.Latitude = sqlite3_column_double(statement, 7);
            harscoLocation.Longitude = sqlite3_column_double(statement, 8);
            
            harscoLocation.loadingHours = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 9)];
            
            harscoLocation.officeHours = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 10)];
            
            harscoLocation.weekdayHours = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 10)];
            harscoLocation.saturdayHours = @"Closed";
            harscoLocation.sundayHours = @"Closed";
            
            
             //NSLog(@"email is %@",harscoLocation.telephone);
        }
    }
    
    if(harscoLocation)
    return [harscoLocation autorelease];
    
    return nil;
    
}

//This method is for Contact Us page it pulls out all the locations in alphabetical order

-(NSMutableArray*)getAllLocations
{
     //NSString* sqlQuery = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",@"select * from ",PC_POSITIONS,@" where ordernumber = '",order.orderNumber,@"'",@" order by positionint;"];
    
    NSString* sqlQuery = @"select * from harscolocations order by zipcode";
    
    NSMutableArray* resultLocations = [[NSMutableArray alloc] init];
    
    sqlite3_stmt* statement = NULL;
    
    if(sqlite3_prepare(database, [sqlQuery UTF8String], -1, &statement, 0) != SQLITE_OK)
    {
        //NSLog(@"%s",sqlite3_errmsg(database));
        [sqlQuery release];
    }
    else
    {
        [sqlQuery release];
        while(sqlite3_step(statement) == SQLITE_ROW)
        {
            
            NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
            
            Location* locationObject = [[Location alloc] init];
            
            
            locationObject.name = [[[NSString alloc] initWithFormat:@"%s",(char *)sqlite3_column_text(statement, 0) ] autorelease];
            
            locationObject.address = [NSString stringWithFormat:@"%s%@%s%@%s",(char *)sqlite3_column_text(statement, 1),@",",(char *)sqlite3_column_text(statement, 2),@",",(char *)sqlite3_column_text(statement, 3)];
            
            locationObject.streetAddress = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 1)];
            locationObject.city =  [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 2)];
            locationObject.stateAndZip = [[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 3)] stringByReplacingOccurrencesOfString:@" " withString:@""];
            locationObject.state = [locationObject.stateAndZip stringByReplacingOccurrencesOfString:@"[0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ locationObject.stateAndZip length])];
            locationObject.zipCode = [locationObject.stateAndZip stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ locationObject.stateAndZip length])];
            
            // //NSLog(@"zip is %@",[locationObject.stateAndZip stringByReplacingOccurrencesOfString:@"[0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [ locationObject.stateAndZip length])]);
            
            locationObject.telephone = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 4)];
            locationObject.webSite = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 5)];
            
            locationObject.email = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 6)];
            
           // //NSLog(@"email is %@",locationObject.email);
            locationObject.Latitude = sqlite3_column_double(statement, 7);
            locationObject.Longitude = sqlite3_column_double(statement, 8);
            
            locationObject.loadingHours = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 9)];
            
             locationObject.officeHours = [NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 10)];
            
            
            
            //            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 0)]);
            //            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 1)]);
            //            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 2)]);
            //            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 3)]);
            //            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 4)]);
            //            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 5)]);
            //            //NSLog(@"%@",[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(statement, 6)]);
            //            //NSLog(@"%f",sqlite3_column_double(statement, 7));
            //            //NSLog(@"%f",sqlite3_column_double(statement, 8));
            //            //NSLog(@"%f",sqlite3_column_double(statement, 9));
            
            [resultLocations addObject:locationObject];
            
            [locationObject release];
            
            [pool release];

            
            
        }
    }
    
    sqlite3_finalize(statement);
    
    return [resultLocations autorelease];

}


//This method has been used from the following resource http://www.thismuchiknow.co.uk/?p=71
//Tested for all the records we have nearly 200 it takes ~ 20 ms which is good for our use case

static void distanceFunc(sqlite3_context *context, int argc, sqlite3_value **argv)
{
    // check that we have four arguments (lat1, lon1, lat2, lon2)
    assert(argc == 4);
    // check that all four arguments are non-null
    if (sqlite3_value_type(argv[0]) == SQLITE_NULL || sqlite3_value_type(argv[1]) == SQLITE_NULL || sqlite3_value_type(argv[2]) == SQLITE_NULL || sqlite3_value_type(argv[3]) == SQLITE_NULL) {
        sqlite3_result_null(context);
        return;
    }
    // get the four argument values
    double lat1 = sqlite3_value_double(argv[0]);
    double lon1 = sqlite3_value_double(argv[1]);
    double lat2 = sqlite3_value_double(argv[2]);
    double lon2 = sqlite3_value_double(argv[3]);
    // convert lat1 and lat2 into radians now, to avoid doing it twice below
    double lat1rad = DEG2RAD(lat1);
    double lat2rad = DEG2RAD(lat2);
    // apply the spherical law of cosines to our latitudes and longitudes, and set the result appropriately
    // 6378.1 is the approximate radius of the earth in kilometres
    sqlite3_result_double(context, acos(sin(lat1rad) * sin(lat2rad) + cos(lat1rad) * cos(lat2rad) * cos(DEG2RAD(lon2) - DEG2RAD(lon1))) * 6378.1);
    
    
}



@end

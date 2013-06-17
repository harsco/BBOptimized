//
//  ConstantDefines.h
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//


//Yes, it is PMS 165.C: 0M: 59Y: 96K: 0R:245G: 132B: 38Web/hex color: #f58426

#import <Foundation/Foundation.h>

//User Interface Related
#define GETTABLECELLBACKGROUND [UIColor colorWithRed:(214.0)/255.0 green:(216.0)/255.0 blue:(211.0)/255.0 alpha:(1)]


#define IsRunningTallPhone() ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)

#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))

#define LOCATIONSDB @"location.db"
#define DEG2RAD(degrees) (degrees * 0.01745327) // degrees * pi over 180
#define RELEASE_TO_NIL(x) { if (x!=nil) { [x release]; x = nil; } }

#define DEFAULT_EMAIL @"reedcs@harsco.com" 
#define FAQNUMBER 6;


#define NETWORKERROR @"Network Error !!"
#define NETWORKERRORMESSAGE @"No Active Internet Connection Found. Please go to settings and enable a Network Connection"


#define BBORIGINALPRODUCTIMAGE @"black beauty product photo"
#define BBGLASSPRODUCTIMAGE @"black beauty glass product photo"
#define BBIRONPRODUCTIMAGE @"black beauty iron product photo"

#define BBORIGINALTHUMBS @"original_thumbs"
#define BBGLASSTHUMBS @"glass_thumbs"
#define BBIRONTHUMBS @"iron-thumbs"


#define BBORIGINALURL @"http://www.blackbeautyabrasives.com/admin/resources/cph-msds-na-black-beautyr-.pdf.pdf"
#define BBGLASSURL @"http://www.blackbeautyabrasives.com/admin/resources/cph-msds-na-black-beautyr-glass.pdf.pdf"
#define BBIRONURL @"http://www.blackbeautyabrasives.com/admin/resources/cph-msds-na-black-beautyr-iron.pdf.pdf"

#define BBORIGINAL @"Black Beauty Original.pdf"
#define BBGLASS    @"Black Beauty Glass.pdf"
#define BBIRON     @"Black Beauty Iron.pdf"

#define SYSTEMVERSION5 @"5.1"
#define ISIOS5 [UIDevice currentDevice] systemVersion]
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)


//Location Errors
#define LOCATIONACCESSDENIED @"Location Services access denied. Please enable Location Services for the App in Settings"
#define UNKNOWNLOCATION @"Your current Location currently unknown"
#define GENERICERROR @"Unable to determine your current Location..Please enter your Location (if Known) in the search box and press search key"
//uncomment only if you are a developer
//#define DEVELOPMENT 1

typedef enum  {
    
    MyLocation,
    OtherLocation
}USERPREFERENCE;

typedef enum  {
    
    BBOriginal,
    BBGlass,
    BBIron
}PRODUCTTYPE;


@interface ConstantDefines : NSObject

@end

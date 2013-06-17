//
//  locationSearchResultsVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/22/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "storeResultsTableCell.h"
#import "LocationManager.h"
#import "BBStoreAnnotation.h"
#import "UserLocationAnnotation.h"
#import "LocationDetailsVC.h"
#import "NetworkInterface.h"
#import "Utilities.h"

@interface locationSearchResultsVC : UIViewController<locationSearchResultsProtocol,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,MKMapViewDelegate>
{
    IBOutlet MKMapView* mapView;
    IBOutlet UITableView* locationsListView;
    IBOutlet UISearchBar* locationSearchBar;
    
    UIAlertView* fetchingResultsAlert;
    UISegmentedControl *segmentedControl;
    
    NSMutableArray* locationsDetails;
    NSMutableArray* annotationArray;
    NSArray* mapAnnotaionsArray;
    NSArray* locations;
    
    LocationManager* locManagerObj;
    Location* hotLocation;
    
    int userInput;
}

@property(nonatomic,retain)IBOutlet MKMapView* mapView;
@property(nonatomic,retain)IBOutlet UITableView* locationsListView;
@property(nonatomic,retain)IBOutlet UISegmentedControl* viewSelectionControl;
@property(nonatomic,retain)IBOutlet UISearchBar* locationSearchBar;

-(id)initWithUserPreference:(USERPREFERENCE)userPreference;

@end

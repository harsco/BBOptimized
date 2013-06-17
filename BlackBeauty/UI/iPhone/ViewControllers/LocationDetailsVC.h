//
//  LocationDetailsVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/24/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contactUSCell.h"
#import <MapKit/MapKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#import "MapViewController.h"
#import "StoreHoursVC.h"
#import "NetworkInterface.h"
#import "Utilities.h"

@interface LocationDetailsVC : UIViewController<UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate>
{
    UITableView* userOptionsTable;
    UILabel* storeName;
    UILabel* storeStreet;
    UILabel* storeCity;
    
    Location* locationToShow;
    
}

@property(nonatomic,retain)IBOutlet UITableView* userOptionsTable;
@property(nonatomic,retain)IBOutlet UILabel* storeName;
@property(nonatomic,retain)IBOutlet UILabel* storeStreet;
@property(nonatomic,retain)IBOutlet UILabel* storeCity;

-(id)initWithLocation:(Location*)location;


@end

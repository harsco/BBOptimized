//
//  LocatorToolUserInputVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/6/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"
#import "locationSearchResultsVC.h"
#import "NetworkInterface.h"
#import "Utilities.h"

@interface LocatorToolUserInputVC : UIViewController
{
    UIButton* byUserLocationButton;
    UIButton* byUserInputLocationButton;
   // IBOutlet UINavigationBar* headerView;
    
}

@property(nonatomic,retain)IBOutlet UIButton* byUserLocationButton;
@property(nonatomic,retain)IBOutlet UIButton* byUserInputLocationButton;
//@property(nonatomic,retain)IBOutlet UINavigationBar* headerView;

-(IBAction)onUserLocationButtonClicked:(id)sender;
-(IBAction)onUserInputLocationClicked:(id)sender;

@end

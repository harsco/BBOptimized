//
//  HomeScreenVC.h
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppStorage.h"
#import "LocationManager.h"
#import "contactUSVC.h"
#import "LocatorToolUserInputVC.h"
#import "ProductsListVC.h"
#import "aboutUSVC.h"
#import "faqVC.h"
#import "MSDSVC.h"
#import "DocumentViewerVC.h"


@interface HomeScreenVC : UIViewController
{
    IBOutlet UINavigationBar* headerView;
    IBOutlet UIButton* privacyButton;
    
    UINavigationController* rootNavigationController;
}

@property(nonatomic,retain)IBOutlet UINavigationBar* headerView;
@property(nonatomic,retain)IBOutlet UIButton* privacyButton;


//Action methods for different Buttons
-(IBAction)onFindBBToolClicked:(id)sender;
-(IBAction)onContactUsClicked:(id)sender;
-(IBAction)onPrivacyButtonClicked:(id)sender;
-(IBAction)onTOSClicked:(id)sender;
-(IBAction)onMSDSClicked:(id)sender;
-(IBAction)onProfileGuideClicked:(id)sender;
-(IBAction)onAboutUsClicked:(id)sender;

@end

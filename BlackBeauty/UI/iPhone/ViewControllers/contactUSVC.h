//
//  contactUSVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/28/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultTableCell.h"
#import "LocationManager.h"
#import "LocationDetailsVC.h"

@class App_ProductsScreenVC;

@interface contactUSVC : UIViewController<UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate>
{
    UITableView* contactsList;
    NSMutableArray* contactLocationsArray;
    
    //Very rooked way of doing might be replaced by new technique
    
    BOOL isProducts;
    
}

@property(nonatomic,retain)IBOutlet  UITableView* contactsList;
@property(nonatomic)BOOL isProducts;


-(IBAction)onCallUsClicked:(id)sender;
-(IBAction)onEmailUsClicked:(id)sender;


@end

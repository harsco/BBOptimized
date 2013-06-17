//
//  App_ProductsScreenVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/20/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultTableCell.h"
#import "imageFullScreenVC.h"
#import "contactUSVC.h"
#import "Utilities.h"
#import "NetworkInterface.h"
#import "DataSource.h"
#import "DocumentViewerVC.h"

@interface App_ProductsScreenVC : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,dataSourceDelegate>
{
    UIScrollView* productsScrollView;
    UITextView* bulletPointsView;
    
    UIImageView* thumbNailImage;
    UIButton* gradesButton;
    UIButton* packagingButton;
    
    UITableView* userOptionsTable;
    
    UIButton* imageZoomButton;
    
    UIWebView* productInfoWebView;
    UITextView* packagingView;
    
    UIAlertView* fetchingResultsAlert;
    DataSource* dataSource;
}


@property(nonatomic,retain)IBOutlet UIScrollView* productsScrollView;
@property(nonatomic,retain)IBOutlet UITextView* bulletPointsView;
@property(nonatomic,retain)IBOutlet UITextView* packagingView;


@property(nonatomic,retain)IBOutlet UIImageView* thumbNailImage;
@property(nonatomic,retain)IBOutlet UIButton* gradesButton;
@property(nonatomic,retain)IBOutlet UIButton* packagingButton;
@property(nonatomic,retain)IBOutlet UITableView* userOptionsTable;
@property(nonatomic,retain)IBOutlet UIButton* imageZoomButton;
@property(nonatomic,retain)IBOutlet UIWebView* productInfoWebView;


-(IBAction)onImageZoomButtonClicked:(id)sender;
-(IBAction)onGradesButtonClicked:(id)sender;
-(IBAction)onPackagingButton:(id)sender;

@end

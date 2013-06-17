//
//  MSDSVC.h
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataSource.h"
#import "DocumentViewerVC.h"
#import "Utilities.h"

@interface MSDSVC : UIViewController<dataSourceDelegate>
{
    
    UILabel* downloadLabel1;
    UILabel* downloadLabel2;
    UILabel* downloadLabel3;
    
    UIAlertView* fetchingResultsAlert;
    
    DataSource* dataSource;
    
    int type;
    
}

@property(nonatomic,retain)IBOutlet UILabel* downloadLabel1;
@property(nonatomic,retain)IBOutlet UILabel* downloadLabel2;
@property(nonatomic,retain)IBOutlet UILabel* downloadLabel3;

-(IBAction)onMSDSDownloadClicked:(id)sender;


@end

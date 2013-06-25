//
//  StoreHoursVC.h
//  BlackBeauty
//
//  Created by Mahi on 6/10/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreHoursCell.h"

@interface StoreHoursVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIButton* officeHours;
    UIButton* loadingHours;
    UITableView* hoursTable;
    UITextView* defaultLabel;
    UILabel* winterHoursLabel;
    UISegmentedControl* hoursSegment;
    
    Location* location;
}

@property(nonatomic,retain)IBOutlet UIButton* officeHours;
@property(nonatomic,retain)IBOutlet UIButton* loadingHours;
@property(nonatomic,retain)IBOutlet UITableView* hoursTable;
@property(nonatomic,retain)IBOutlet UITextView* defaultLabel;
@property(nonatomic,retain)IBOutlet UILabel* winterHoursLabel;
@property(nonatomic,retain)IBOutlet UISegmentedControl* hoursSegment;
-(id)initWithLocation:(Location*)locationToBeShown;
-(void)segmentAction:(UISegmentedControl*)sender;

@end

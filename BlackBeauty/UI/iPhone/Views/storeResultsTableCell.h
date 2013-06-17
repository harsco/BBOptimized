//
//  storeResultsTableCell.h
//  BlackBeauty
//
//  Created by Mahi on 5/22/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface storeResultsTableCell : UITableViewCell
{
    IBOutlet UILabel* storeName;
    IBOutlet UILabel* storeAddress;
    IBOutlet UILabel* storeDistance;
    IBOutlet UILabel* storeContactNumber;
}

@property(nonatomic,retain) IBOutlet UILabel* storeName;
@property(nonatomic,retain) IBOutlet UILabel* storeAddress;
@property(nonatomic,retain) IBOutlet UILabel* storeDistance;
@property(nonatomic,retain) IBOutlet UILabel* storeContactNumber;

@end

//
//  StoreHoursCell.h
//  BlackBeauty
//
//  Created by Mahi on 6/21/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreHoursCell : UITableViewCell
{
    IBOutlet UILabel* dayLabel;
    IBOutlet UILabel* workingHoursLabel;
}

@property(nonatomic,retain)IBOutlet UILabel* dayLabel;
@property(nonatomic,retain)IBOutlet UILabel* workingHoursLabel;

@end

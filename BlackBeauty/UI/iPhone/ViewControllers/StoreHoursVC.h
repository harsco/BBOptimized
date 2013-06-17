//
//  StoreHoursVC.h
//  BlackBeauty
//
//  Created by Mahi on 6/10/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreHoursVC : UIViewController
{
    UIButton* officeHours;
    UIButton* loadingHours;
    
    Location* location;
}

@property(nonatomic,retain)IBOutlet UIButton* officeHours;
@property(nonatomic,retain)IBOutlet UIButton* loadingHours;

-(id)initWithLocation:(Location*)locationToBeShown;

@end

//
//  StoreHoursVC.m
//  BlackBeauty
//
//  Created by Mahi on 6/10/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "StoreHoursVC.h"

@interface StoreHoursVC ()

@end

@implementation StoreHoursVC
@synthesize officeHours,loadingHours;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithLocation:(Location*)locationToBeShown
{
    if(self = [super init])
    {
        location = [locationToBeShown retain];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.officeHours.titleLabel.text = [NSString stringWithFormat:@"%@%@",@"Office Hours: ",location.officeHours];
    //self.loadingHours.titleLabel.text = [NSString stringWithFormat:@"%@%@",@"Loading Hours:",location.loadingHours];
    [self.loadingHours setTitle:[NSString stringWithFormat:@"%@%@",@"Office Hours: ",location.officeHours] forState:UIControlStateNormal];
    
    [self.loadingHours setTitle:[NSString stringWithFormat:@"%@%@",@"Loading Hours: ",location.loadingHours] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

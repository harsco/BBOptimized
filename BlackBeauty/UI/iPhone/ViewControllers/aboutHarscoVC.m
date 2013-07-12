//
//  aboutHarscoVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/29/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "aboutHarscoVC.h"

@interface aboutHarscoVC ()

@end

@implementation aboutHarscoVC
@synthesize aboutUsHeader;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    float labelwidth;
    if(SYSTEM_VERSION_EQUAL_TO(SYSTEMVERSION5))
        labelwidth = 150.0;
    else
        labelwidth = 120;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelwidth, 30)];
    //UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	[label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setText:@"About Harsco"];
    [label setTextAlignment:NSTextAlignmentCenter];
	[self.aboutUsHeader.topItem setTitleView:label];
	[label release];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    //self.backGroundImage
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action Methods

-(IBAction)onDoneClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)onBackClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

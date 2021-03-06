//
//  LocatorToolUserInputVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/6/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "LocatorToolUserInputVC.h"

@interface LocatorToolUserInputVC ()

@end

@implementation LocatorToolUserInputVC

@synthesize byUserInputLocationButton,byUserLocationButton;

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
    UIImage* image = [UIImage imageNamed:@"back-button"];
    CGRect frameimg;
    
    if(IS_RETINA)
        frameimg = CGRectMake(0, 0, 30, 30);
    else
        frameimg = CGRectMake(0, 0, 20, 20);

    UIButton *button = [[UIButton alloc] initWithFrame:frameimg];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBackClick:)
         forControlEvents:UIControlEventTouchUpInside];
    [button setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *backButton =[[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    
    self.navigationController.navigationBar.topItem.leftBarButtonItem = backButton;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    self.title = @"Where To Buy";
    
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    self.byUserInputLocationButton = nil;
    self.byUserLocationButton = nil;
  
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    float labelwidth;
    if(SYSTEM_VERSION_EQUAL_TO(SYSTEMVERSION5))
        labelwidth = 250.0;
    else
        labelwidth = 120;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelwidth, 30)];
    
   // UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	[label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setText:@"Where To Buy"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.navigationItem setTitleView:label];
    [label release];
}

-(void)dealloc
{
    [byUserInputLocationButton release];
    [byUserLocationButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    RELEASE_TO_NIL(byUserLocationButton);
    RELEASE_TO_NIL(byUserInputLocationButton);
}


-(void)onBackClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onUserLocationButtonClicked:(id)sender
{
    
//    testLocationResultsVC* testVC = [[testLocationResultsVC alloc] initWithUserPreference:MyLocation];
//    [self.navigationController pushViewController:testVC animated:YES];
//    [testVC release];
    
    if([[NetworkInterface getInstance] isInternetAvailable])
    {
        locationSearchResultsVC* resultsVC = [[locationSearchResultsVC alloc] initWithUserPreference:MyLocation];
        [self.navigationController pushViewController:resultsVC animated:YES];
        [resultsVC release];
        
    }
    else
    {
        [Utilities showAlertOKWithTitle:NETWORKERROR withMessage:NETWORKERRORMESSAGE];
    }
    
    
}

-(IBAction)onUserInputLocationClicked:(id)sender
{
//    testLocationResultsVC* testVC = [[testLocationResultsVC alloc] initWithUserPreference:OtherLocation];
//    [self.navigationController pushViewController:testVC animated:YES];
//    [testVC release];
    if([[NetworkInterface getInstance] isInternetAvailable])
    {
        locationSearchResultsVC* resultsVC = [[locationSearchResultsVC alloc] initWithUserPreference:OtherLocation];
        [self.navigationController pushViewController:resultsVC animated:YES];
        [resultsVC release];
    }
    else
    {
        [Utilities showAlertOKWithTitle:NETWORKERROR withMessage:NETWORKERRORMESSAGE];
    }
}

@end

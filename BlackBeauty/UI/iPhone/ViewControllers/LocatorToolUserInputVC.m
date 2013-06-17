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
    UIImage* image = [UIImage imageNamed:@"grid"];
    CGRect frameimg = CGRectMake(0, 0, 25, 25);

    UIButton *button = [[UIButton alloc] initWithFrame:frameimg];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBackClick:)
         forControlEvents:UIControlEventTouchUpInside];
    [button setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *backButton =[[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    
    self.navigationController.navigationBar.topItem.leftBarButtonItem = backButton;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    self.title = @"Where To Buy";
    
//    self.headerView.topItem.leftBarButtonItem = backButton;
    
    if(IS_RETINA)
    {
        NSLog(@"yes");
    }
    
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    self.byUserInputLocationButton = nil;
    self.byUserLocationButton = nil;
  
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
    [self dismissModalViewControllerAnimated:YES];
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

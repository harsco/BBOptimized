//
//  HomeScreenVC.m
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "HomeScreenVC.h"

@interface HomeScreenVC ()

@end

@implementation HomeScreenVC
@synthesize headerView;
@synthesize privacyButton;

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

}
-(void)viewDidUnload
{
    self.headerView = nil;
}

-(void)dealloc
{
    [headerView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Button Action Methods

-(IBAction)onFindBBToolClicked:(id)sender
{
    //[[AppStorage getInstance] getAllLocations];
    
    //Push the screen which takes User Inputs for the search
    LocatorToolUserInputVC* userInputVC = [[LocatorToolUserInputVC alloc] init];
    
    rootNavigationController = [[UINavigationController alloc] initWithRootViewController:userInputVC];
    
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:rootNavigationController animated:YES];
    
    [userInputVC release];
    
}
-(IBAction)onContactUsClicked:(id)sender
{
    contactUSVC* testContact = [[contactUSVC alloc] init];
    
    rootNavigationController = [[UINavigationController alloc] initWithRootViewController:testContact];
    
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:rootNavigationController animated:YES];
    
    [testContact release];
    
}


-(IBAction)onProductsButtonClicked:(id)sender
{
    ProductsListVC* productsScreen = [[ProductsListVC alloc] init];
   
    
   rootNavigationController = [[UINavigationController alloc] initWithRootViewController:productsScreen];
    
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:rootNavigationController animated:YES];
    
    [productsScreen release];
    [rootNavigationController release];
}

-(IBAction)onAboutUsClicked:(id)sender
{
    aboutUSVC* aboutUsScreen = [[aboutUSVC alloc] init];
    //rootNavigationController = [[UINavigationController alloc] initWithRootViewController:aboutUsScreen];
    aboutUsScreen.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:aboutUsScreen animated:YES];
    
    [aboutUsScreen release];
  
    
    
}

-(IBAction)onFaqClicked:(id)sender
{
    faqVC* faqScreen = [[faqVC alloc] init];
    rootNavigationController = [[UINavigationController alloc] initWithRootViewController:faqScreen];
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:rootNavigationController animated:YES completion:nil];
    
    [faqScreen release];
    
    
}

-(IBAction)onMSDSClicked:(id)sender
{
    MSDSVC* msdsScreen = [[MSDSVC alloc] init];
    rootNavigationController = [[UINavigationController alloc] initWithRootViewController:msdsScreen];
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:rootNavigationController animated:YES completion:nil];
    
    [msdsScreen release];

    
}

-(IBAction)onProfileGuideClicked:(id)sender
{
    //[[NSBundle mainBundle] pathForResource:@"grading_original" ofType:@"html"]isDirectory:NO]]
    
    DocumentViewerVC* profileGuideViewer = [[DocumentViewerVC alloc] initWithFilePath:[[NSBundle mainBundle] pathForResource:@"ProfileGuide" ofType:@"pdf"]];
    profileGuideViewer.isProfileGuide = YES;

    //ProfileGuideVC* profileGuideViewer = [[ProfileGuideVC alloc] init];
    
    rootNavigationController = [[UINavigationController alloc] initWithRootViewController:profileGuideViewer];
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:rootNavigationController animated:YES completion:nil];

    
    [profileGuideViewer release];
    
    
}



-(IBAction)onPrivacyButtonClicked:(id)sender
{
    NSLog(@"Privacy Clicked");
}

@end

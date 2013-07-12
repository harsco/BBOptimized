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
@synthesize tosButton;
@synthesize copyrightLabel;

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


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    float labelwidth;
    if(SYSTEM_VERSION_EQUAL_TO(SYSTEMVERSION5))
        labelwidth = 250.0;
    else
        labelwidth = 120;

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelwidth, 30)];
	[label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    [label setTextAlignment:NSTextAlignmentCenter];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setText:@"BLACK BEAUTY® Home"];
    [self.headerView.topItem setTitleView:label];
    [label release];
    
    if(IsRunningTallPhone())
    {
        [self.privacyButton setFrame:CGRectMake(86.0, 500.0, 95, 21)];
        [self.tosButton setFrame:CGRectMake(180.0, 500.0, 77, 21)];
        [self.copyrightLabel setFrame:CGRectMake(48.0, 477.0, 233, 21)];
    }
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
    
    //[self presentModalViewController:rootNavigationController animated:YES];
    [self presentViewController:rootNavigationController animated:YES completion:nil];
    
    [userInputVC release];
    
}
-(IBAction)onContactUsClicked:(id)sender
{
    contactUSVC* testContact = [[contactUSVC alloc] init];
    
    rootNavigationController = [[UINavigationController alloc] initWithRootViewController:testContact];
    
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:rootNavigationController animated:YES completion:nil];
    
    [testContact release];
    
}


-(IBAction)onProductsButtonClicked:(id)sender
{
    ProductsListVC* productsScreen = [[ProductsListVC alloc] init];
   
    
   rootNavigationController = [[UINavigationController alloc] initWithRootViewController:productsScreen];
    
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:rootNavigationController animated:YES completion:nil];
    
    [productsScreen release];
    [rootNavigationController release];
}

-(IBAction)onAboutUsClicked:(id)sender
{
    aboutUSVC* aboutUsScreen = [[aboutUSVC alloc] init];
    //rootNavigationController = [[UINavigationController alloc] initWithRootViewController:aboutUsScreen];
    aboutUsScreen.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:aboutUsScreen animated:YES completion:nil];
    
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

-(IBAction)onTOSClicked:(id)sender
{
    DocumentViewerVC* tosViewer = [[DocumentViewerVC alloc] initWithFilePath:[[NSBundle mainBundle] pathForResource:@"bbeula" ofType:@"rtf"]];

    tosViewer.isTOS = YES;
    
    rootNavigationController = [[UINavigationController alloc] initWithRootViewController:tosViewer];
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:rootNavigationController animated:YES completion:nil];
    
    
    [tosViewer release];
    

    
}

-(IBAction)onPrivacyButtonClicked:(id)sender
{
    DocumentViewerVC* privacyPolicy = [[DocumentViewerVC alloc] initWithFilePath:PRIVACYURL];
    
    privacyPolicy.isPrivacyPolicy = YES;
    
    rootNavigationController = [[UINavigationController alloc] initWithRootViewController:privacyPolicy];
    rootNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:rootNavigationController animated:YES completion:nil];
    
    
    [privacyPolicy release];
}

@end

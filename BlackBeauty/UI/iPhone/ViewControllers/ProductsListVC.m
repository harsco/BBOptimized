//
//  ProductsListVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/16/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "ProductsListVC.h"

@interface ProductsListVC ()

@end

@implementation ProductsListVC
@synthesize headerView;

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
        frameimg = CGRectMake(0, 0, 25, 25);
    
    UIButton *button = [[UIButton alloc] initWithFrame:frameimg];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBackClick:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *backButton =[[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    
    self.navigationController.delegate = self;
   self.navigationController.navigationBar.topItem.leftBarButtonItem = backButton;
   self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
   self.title = @"BLACK BEAUTY® Products";
    

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


-(void)onBackClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark button methods

-(IBAction)onBBOriginalClicked:(id)sender
{
    BBOriginalProductInfoVC* originalProduct = [[BBOriginalProductInfoVC alloc] initWithNibName:@"App_ProductsScreenVC" bundle:nil];
    
    [self.navigationController pushViewController:originalProduct animated:YES];
    
    [originalProduct release];
}

-(IBAction)onBBGlassClicked:(id)sender
{
    BBGlassProductInfoVC* glassProduct = [[BBGlassProductInfoVC alloc] initWithNibName:@"App_ProductsScreenVC" bundle:nil];
    
    [self.navigationController pushViewController:glassProduct animated:YES];
    
    [glassProduct release];
    
}

-(IBAction)onBBIronClicked:(id)sender
{
    BBIronProductInfoVC* ironProduct = [[BBIronProductInfoVC alloc] initWithNibName:@"App_ProductsScreenVC" bundle:nil];
    
    [self.navigationController pushViewController:ironProduct animated:YES];
    
    [ironProduct release];
}



#pragma mark Navigation Callback

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                       initWithTitle: @"Products"
                                      style: UIBarButtonItemStyleBordered
                                       target: nil action: nil];
    
    self.navigationItem.backBarButtonItem = backButton;
    [backButton release];
}



@end

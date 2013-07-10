//
//  EULAVCViewController.m
//  BlackBeauty
//
//  Created by Mahi on 7/9/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "EULAVCViewController.h"

@interface EULAVCViewController ()

@end

@implementation EULAVCViewController
@synthesize eulaView;
@synthesize acceptView;
@synthesize acceptButton;

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
    
    [self.eulaView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:BBEULA ofType:@"rtf"]]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if(IsRunningTallPhone())
    {
        [self.acceptView setFrame:CGRectMake(0.0, 480.0, 320, 67)];
        [self.eulaView setFrame:CGRectMake(0.0, 44.0, 320, 480)];
    }
}


-(IBAction)onEULAButtonClicked:(UIButton*)sender
{
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:EULAKEY];
    
    HomeScreenVC* homeScreen = [[HomeScreenVC alloc] init];
    homeScreen.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:homeScreen animated:YES completion:nil];
    
    [homeScreen release];
    
}

@end

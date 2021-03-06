//
//  DocumentViewerVC.m
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "DocumentViewerVC.h"

@interface DocumentViewerVC ()

@end

@implementation DocumentViewerVC
@synthesize documentViewer,loadingIndicator,isProfileGuide,isTOS,isPrivacyPolicy,isSpecifications;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isProfileGuide = NO;
        isTOS = NO;
        isPrivacyPolicy = NO;
        isSpecifications = NO;
    }
    return self;
}


-(id)initWithFilePath:(NSString*)filePath
{
    if(self = [super init])
    {
        filePathToBeRendered = [[NSString alloc] initWithString:filePath];
        //NSLog(@"path is %@",filePathToBeRendered);
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    float labelwidth;
    if(SYSTEM_VERSION_EQUAL_TO(SYSTEMVERSION5))
        labelwidth = 280.0;
    else
        labelwidth = 120;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelwidth, 30)];
    [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    
    if(isProfileGuide)
    {
        //self.title = @"Profile Guide";
        
        [label setText:@"Profile Guide"];
        
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
        
    }
    else if(isTOS)
    {
        //self.title = @"EULA";
        [label setText:@"End User License Agreement"];
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
    }
    
    else if(isPrivacyPolicy)
    {
        //self.title = @"Privacy Policy";
        [label setText:@"Privacy Policy"];
         
        
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

    }
    
    else if(isSpecifications)
    {
        UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(onActionClicked:)];
        //self.navigationController.navigationBar.topItem.rightBarButtonItem = shareButton;
        [self.navigationItem setRightBarButtonItem:shareButton];
        [shareButton release];
        
        [label setText:@"Specifications"];
                
        
    }
    else
    {
        UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(onActionClicked:)];
        //self.navigationController.navigationBar.topItem.rightBarButtonItem = shareButton;
        [self.navigationItem setRightBarButtonItem:shareButton];
        [shareButton release];
        
       
        if([[filePathToBeRendered lastPathComponent] isEqualToString:BBORIGINAL])
        {
            [label setText:@"MSDS ORIGINAL"];
            
        }
        else if([[filePathToBeRendered lastPathComponent] isEqualToString:BBGLASS])
        {
            [label setText:@"MSDS GLASS"];
            

        }
        else
        {
            [label setText:@"MSDS IRON"];

        }
    }
    
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.navigationItem setTitleView:label];
    [label release];
    
    [self openFile];
}


-(void)viewWillAppear:(BOOL)animated
{
    if(IsRunningTallPhone())
    {
        [self.documentViewer setFrame:CGRectMake(0, 0, 320, 540)];
    }
    

}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.documentViewer setDelegate:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)openFile
{
     NSLog(@"loaded");
    [self.loadingIndicator setHidden:NO];
    [self.loadingIndicator startAnimating];
    
    if(isPrivacyPolicy)
    [self.documentViewer loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:filePathToBeRendered]]];
    else
    //[self.documentViewer loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePathToBeRendered]]];
        [self.documentViewer loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePathToBeRendered] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.0]];
}

#pragma mark Action Methods
-(void)onBackClick:(id)sender
{
    [self.documentViewer setDelegate:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onActionClicked:(id)sender
{
    
    UIActionSheet* shareAction = [[UIActionSheet alloc] initWithTitle:@"What would you like to do with this file?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Email",@"View in other Apps", nil];
    
    [shareAction showInView:self.view];
    
}



#pragma mark Action Sheet Call Backs

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        //Email Clicked
        
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
         ////NSLog(@"path is %@",filePathToBeRendered);
         [mailController setSubject:[[[filePathToBeRendered lastPathComponent] stringByDeletingPathExtension] stringByAppendingString:@" MSDS"]];
         
         //NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"png"];
         NSData *myData = [NSData dataWithContentsOfFile:filePathToBeRendered];
         [mailController addAttachmentData:myData mimeType:@"application/pdf" fileName:[[filePathToBeRendered lastPathComponent] stringByDeletingPathExtension]];
         
         mailController.mailComposeDelegate = self;
         
         
         if ( mailController != nil ) {
         if ([MFMailComposeViewController canSendMail]){
         //[self presentModalViewController:mailController animated:YES];
             [self presentViewController:mailController animated:YES completion:nil];
         }
         else{
         //throw error
         
         }
         }
         
         [mailController release];
        
        
    }
    else if(buttonIndex == 1)
    {
        //present options to open in other apps
        NSURL *targetURL = [NSURL fileURLWithPath:filePathToBeRendered];
    
         UIDocumentInteractionController* docController = [UIDocumentInteractionController interactionControllerWithURL:targetURL];

         docController.delegate = self;
    
         [docController retain];
        [docController presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];
    }
}

#pragma mark webview delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"loaded");
    [self.loadingIndicator stopAnimating];
    [self.loadingIndicator setHidden:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.loadingIndicator stopAnimating];
    [self.loadingIndicator setHidden:YES];
    
    [Utilities showAlertOKWithTitle:@"Error Loading Document" withMessage:[error localizedDescription]];
    
}


#pragma mark Mail Composer Delegate

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end

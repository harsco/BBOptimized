//
//  faqDetailsVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "faqDetailsVC.h"

@interface faqDetailsVC ()

@end

@implementation faqDetailsVC
@synthesize faqAnswerView,faqQuestion,emailUSButton,callUSButton,callImage,emailImage,faqToBeShown,faqQuestionView,loadingIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithFAQ:(FAQ*)faqObject
{
    if(self = [super init])
    {
        faqToBeShown = [faqObject retain];
         didShowEmail = NO;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   
    
    [self.faqAnswerView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:faqToBeShown.answer ofType:@"html"]isDirectory:NO]]];
    
    
    
    self.faqQuestion.text = faqToBeShown.question;
    //self.title = @"BLACK BEAUTY® Help";
    float labelwidth;
    if(SYSTEM_VERSION_EQUAL_TO(SYSTEMVERSION5))
        labelwidth = 250.0;
    else
        labelwidth = 120;
    
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelwidth, 30)];
    //label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	[label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setText:@"BLACK BEAUTY® Help"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.navigationItem setTitleView:label];
    [label release];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if(!didShowEmail)
    {
        [self.loadingIndicator setHidden:NO];
        [self.loadingIndicator startAnimating];
    }
        
   
    
    if([faqToBeShown.question isEqualToString:@"How do I order BLACK BEAUTY abrasives?"])
    {
        
        
        [self.callUSButton setHidden:NO];
        [self.emailUSButton setHidden:NO];
        [self.callImage setHidden:NO];
        [self.emailImage setHidden:NO];
        
        if(IsRunningTallPhone())
        {
            [self.callUSButton setFrame:CGRectMake(10, 355, 300, 60)];
            [self.callImage setFrame:CGRectMake(20, 365, 40, 40)];
            
            [self.emailUSButton setFrame:CGRectMake(10, 425, 300, 60)];
            [self.emailImage setFrame:CGRectMake(20, 435, 40, 40)];
        }
        
        if(!IsRunningTallPhone())
            [self.faqAnswerView setFrame:CGRectMake(10, 75, 300, 220)];
        
    }
    
    else
    {
        if(IsRunningTallPhone())
        {
            [self.faqAnswerView setFrame:CGRectMake(10, 100, 300, 270)];
            [self.faqQuestionView setFrame:CGRectMake(10, 35, 300, 60)];
        }
    }
    
   
}



-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [self.faqAnswerView setDelegate:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onCallUsClicked:(id)sender
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        
        
        //NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"telprompt://",strippedNumber]];
        NSURL *url = [NSURL URLWithString:@"telprompt://18887333646"];
        
        // //NSLog(@"number is %@",[NSString stringWithFormat:@"%@%@",@"telprompt://",[telePhone stringByReplacingOccurrencesOfString:@"-" withString:@""]]);
        [[UIApplication sharedApplication] openURL:url];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Call Alert" message:@"Your device doesn't support a telephone call" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
        [Notpermitted release];
    }
    
}
-(IBAction)onEmailUsClicked:(id)sender
{
    didShowEmail = YES;
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
    
    [mailController setSubject:@"From BLACK BEAUTY® App"];
    // [mailController setMessageBody:@"my message" isHTML:NO];
    [mailController setToRecipients:[NSArray arrayWithObjects:DEFAULT_EMAIL, nil]];
    
    mailController.mailComposeDelegate = self;
    
    
    if ( mailController != nil ) {
        if ([MFMailComposeViewController canSendMail]){
            //[self presentModalViewController:mailController animated:YES];
            [self presentViewController:mailController animated:YES completion:nil];
        }
        else{
            //throw error
            [Utilities showAlertOKWithTitle:@"Email Alert!!!" withMessage:@"Your device doesnot support Email or Email has not been set up"];
            
        }
    }
    
    [mailController release];
}


#pragma mark Mail Composer Delegate

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark Webview Delegate



- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;

{
	
    
    if ([request.URL.scheme isEqualToString:@"mailto"]) {
         // make sure this device is setup to send email
         if ([MFMailComposeViewController canSendMail]) {
             // create mail composer object
             MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
             
             // make this view the delegate
             mailer.mailComposeDelegate = self;
             
             [mailer setSubject:@"From BLACK BEAUTY® App"];
             
             // set recipient
             [mailer setToRecipients:[NSArray arrayWithObjects:DEFAULT_EMAIL,@"inquiries-m@harsco.com",nil]];
             
             // generate message body
             NSString *body = @"Hello Recently Used your Black Beauty App and need some assistance with";
             
             // add to users signature
             [mailer setMessageBody:body isHTML:NO];
             
             // present user with composer screen
             [self presentViewController:mailer animated:YES completion:nil];
             
             // release composer object
             [mailer release];
             
             
         } else {
             // alert to user there is no email support
             [Utilities showAlertOKWithTitle:@"Email Alert!!!" withMessage:@"Email has not been set up"];
             
             
         }
        
        return NO;
    }
	
    
    NSURL *loadURL = [[request URL] retain];
	// Check navigationType. Else this alert will be visible on every load of UIWebView
	if ( ( [ [ loadURL scheme ] isEqualToString: @"http"] || [ [ loadURL scheme ] isEqualToString: @"https" ] ) &&  navigationType == UIWebViewNavigationTypeLinkClicked )
    {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Open In Safari???"
                                                               message :@"Clicking YES would leave the Black Beauty App and launch Safari."
                                                               delegate:self
                                                      cancelButtonTitle: @"No"
                                                      otherButtonTitles:@"Yes", nil];
                                      
      [alert show];
      [alert release];
      
      savedLink = [[request URL] retain];
      
      [loadURL release];
      } 
      else
      {
          [loadURL release];
          return YES;
      }
      return NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadingIndicator stopAnimating];
    [self.loadingIndicator setHidden:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex == 1)
	{
		[[UIApplication sharedApplication] openURL:savedLink];
	}
    else
    {
        [savedLink release];
        savedLink = nil;
    }
}

@end

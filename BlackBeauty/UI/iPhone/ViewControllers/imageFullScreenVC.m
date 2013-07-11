//
//  imageFullScreenVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/21/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "imageFullScreenVC.h"

@interface imageFullScreenVC ()

@end

@implementation imageFullScreenVC

@synthesize imageScrollView,fullSizeImageView,pageTitle,header;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWIthImage:(UIImage*)image
{
    if(self = [super init])
    {
        fullScreenImage = [image retain];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.imageScrollView setContentSize:CGSizeMake(320, 416)];
    self.imageScrollView.maximumZoomScale = 4.0;
    //self.imageScrollView.minimumZoomScale = 0.75;
    [self.imageScrollView setClipsToBounds:YES];
    self.imageScrollView.delegate = self;
    self.fullSizeImageView.image = fullScreenImage;
    

}

-(void)viewWillAppear:(BOOL)animated
{
    if(pageTitle)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 120, 30)];
        [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor whiteColor]];
        [label setText:pageTitle];
        [label setTextAlignment:NSTextAlignmentCenter];
        [self.header.topItem setTitleView:label];
        [label release];
    }
        //self.header.topItem.title = pageTitle;
}

-(void)viewDidUnload
{
    self.imageScrollView = nil;
    self.fullSizeImageView = nil;
    [fullScreenImage release];
    
}

-(void)dealloc
{
    [imageScrollView release];
    [fullSizeImageView release];
    [fullScreenImage release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action methods

-(IBAction)onDoneButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Scroll View Delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.fullSizeImageView;
}

@end

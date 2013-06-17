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

@synthesize imageScrollView,fullSizeImageView;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action methods

-(IBAction)onDoneButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark Scroll View Delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.fullSizeImageView;
}

@end

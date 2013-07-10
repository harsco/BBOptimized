//
//  BBGlassProductInfoVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/29/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "BBGlassProductInfoVC.h"

@interface BBGlassProductInfoVC ()

@end

@implementation BBGlassProductInfoVC

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
	// Do any additional setup after loading the view.
    
    //self.title = @"BLACK BEAUTY® GLASS";
    [self.productInfoWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"grading_glass" ofType:@"html"]isDirectory:NO]]];
    [self.packagingView setText:@"Available in 50lb bags at 60 bags per pallet and Jumbo bags loaded up to 1.5 tons (3,000lbs).  Shrink wrap available."];
    [self.bulletPointsView setText:@"• 100% post-consumer bottle glass                                                                • Less than 1% free silica                                                                                                   • Non-reactive, chemically inert                                                                                             • Uniform density                                                                                                            • Produces white metal surface                                                                                               • Increased visibility & production"];
    
     self.thumbNailImage.image = [UIImage imageNamed:BBGLASSTHUMBS];
     [self.thumbsButton setImage:[UIImage imageNamed:BBGLASSTHUMBS]forState:UIControlStateNormal];
}


-(void)viewDidAppear:(BOOL)animated
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	[label setFont:[UIFont boldSystemFontOfSize:18.0]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setText:@"BLACK BEAUTY® GLASS"];
	[self.navigationController.navigationBar.topItem setTitleView:label];
	[label release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)onImageZoomButtonClicked:(id)sender
{
    
    imageFullScreenVC* fullImage = [[imageFullScreenVC alloc] initWIthImage:[UIImage imageNamed:BBGLASSPRODUCTIMAGE]];
    fullImage.pageTitle = @"BLACK BEAUTY® GLASS";

    fullImage.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //[self presentModalViewController:fullImage animated:YES];
    [self presentViewController:fullImage animated:YES completion:nil];
    
    [fullImage release];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 2)
    {
        contactUSVC* contactUSScreen = [[contactUSVC alloc] init];
        contactUSScreen.isProducts = YES;
        
        [self.navigationController pushViewController:contactUSScreen animated:YES];
        
        [contactUSScreen release];
    }
    else if(indexPath.section == 0)
    {
        if([[Utilities getInstance] isFileExists:BBGLASS])
        {
            [self viewDocument];
        }
        else
        {
            if([[NetworkInterface getInstance] isInternetAvailable])
            {
                [dataSource downloadMSDSFileForProduct:BBGlass];
            }
            else
            {
                [Utilities showAlertOKWithTitle:@"Network Error!!" withMessage:@"You appear to be offline..Please go to settings and enable a network connection"];
                
            }
            
        }
        
    }
    else if(indexPath.section == 1)
    {
        DocumentViewerVC* pdfViewer = [[DocumentViewerVC alloc] initWithFilePath:[[NSBundle mainBundle] pathForResource:BBGLASSSPECS ofType:@"pdf"]];
        [self.navigationController pushViewController:pdfViewer animated:YES];
        
        [pdfViewer release];
    }
    


}

-(void)viewDocument
{
    NSString *resourceDocPath = [[NSString alloc] initWithString:[[[[NSBundle mainBundle]  resourcePath] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Documents"]];
    
    //NSLog(@"path for resource is %@",resourceDocPath);
    
    NSString *filePath = [resourceDocPath stringByAppendingPathComponent:BBGLASS];
    [resourceDocPath release];
    DocumentViewerVC* pdfViewer = [[DocumentViewerVC alloc] initWithFilePath:filePath];
    [self.navigationController pushViewController:pdfViewer animated:YES];
    
    [pdfViewer release];
}

@end

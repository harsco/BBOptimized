//
//  BBOriginalProductInfoVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/29/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "BBOriginalProductInfoVC.h"

@interface BBOriginalProductInfoVC ()

@end

@implementation BBOriginalProductInfoVC

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
    self.title = @"BLACK BEAUTY®";
    self.thumbNailImage.image = [UIImage imageNamed:BBORIGINALTHUMBS];
    [self initVars];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)initVars
{
    [self.productInfoWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"grading_original" ofType:@"html"]isDirectory:NO]]];
    [self.packagingView setText:@"Available in 50lb bags at 60 bags per pallet, 100lb bags at 30 bags per pallet, Jumbo bags loaded up to 2 tons (4,000lbs) and bulk.  Shrink wrap available. Pre-blended with dust suppressant available upon request"];
    
    [self.bulletPointsView setText:@"• Fast cutting, consistent gradation                                                            • Less than 0.1% free silica                                                                                                 • Low-dusting , passes CA Title 17 (CARB), select plants                                                                     • Meets SSPC AB1, MIL-A-22262B(SH), 40CFR 261.24a (TCLP)                                                                     • Chemically inert"];
    
    
}


-(IBAction)onImageZoomButtonClicked:(id)sender
{
   
    imageFullScreenVC* fullImage = [[imageFullScreenVC alloc] initWIthImage:[UIImage imageNamed:BBORIGINALPRODUCTIMAGE]];
    fullImage.pageTitle = @"BLACK BEAUTY®";
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
        if([[Utilities getInstance] isFileExists:BBORIGINAL])
        {
            [self viewDocument];
        }
        else
        {
            if([[NetworkInterface getInstance] isInternetAvailable])
            {
                [dataSource downloadMSDSFileForProduct:BBOriginal];
            }
            else
            {
                [Utilities showAlertOKWithTitle:@"Network Error!!" withMessage:@"You appear to be offline..Please go to settings and enable a network connection"];
                
            }
            
        }

    }
    else if(indexPath.section == 1)
    {
        DocumentViewerVC* pdfViewer = [[DocumentViewerVC alloc] initWithFilePath:[[NSBundle mainBundle] pathForResource:BBORIGINALSPECS ofType:@"pdf"]];
        [self.navigationController pushViewController:pdfViewer animated:YES];
        
        [pdfViewer release];

    }
    
}


-(void)viewDocument
{
    NSString *resourceDocPath = [[NSString alloc] initWithString:[[[[NSBundle mainBundle]  resourcePath] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Documents"]];
    
    NSLog(@"path for resource is %@",resourceDocPath);
    
    NSString *filePath = [resourceDocPath stringByAppendingPathComponent:BBORIGINAL];
    [resourceDocPath release];
    DocumentViewerVC* pdfViewer = [[DocumentViewerVC alloc] initWithFilePath:filePath];
    [self.navigationController pushViewController:pdfViewer animated:YES];
    
    [pdfViewer release];
}





@end

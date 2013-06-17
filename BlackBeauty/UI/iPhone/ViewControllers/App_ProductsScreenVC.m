//
//  App_ProductsScreenVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/20/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "App_ProductsScreenVC.h"

@interface App_ProductsScreenVC ()

@end

@implementation App_ProductsScreenVC
@synthesize productsScrollView,bulletPointsView,thumbNailImage,gradesButton,packagingButton,userOptionsTable,imageZoomButton,productInfoWebView,packagingView;

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
    
    [self.productsScrollView setContentSize:CGSizeMake(320, 1250)];
    self.productsScrollView.maximumZoomScale = 4.0;
    [self.productsScrollView setClipsToBounds:YES];
    self.productsScrollView.delegate = self;
    [self.productsScrollView setScrollEnabled:YES];
    
    dataSource = [[DataSource alloc] init];
    dataSource.delegate = self;
    
    
    
    //self.navigationItem.backBarButtonItem = backButton;
    
    //self.navigationController.navigationBar.topItem.leftBarButtonItem.title = @"Products";
    
    self.title = @" BLACK BEAUTY® GLASS";
}

-(void)viewWillAppear:(BOOL)animated
{
    NSIndexPath *tableSelection = [self.userOptionsTable indexPathForSelectedRow];
    [self.userOptionsTable deselectRowAtIndexPath:tableSelection animated:NO];
    if(IsRunningTallPhone())
    {
        [self.productsScrollView setFrame:CGRectMake(0.0, 0.0, 320, 568)];
    }
    else
    {
        [self.productsScrollView setFrame:CGRectMake(0.0, 0.0, 320, 460)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark action methods


-(void)viewDocument
{
    
}

-(IBAction)onImageZoomButtonClicked:(id)sender
{
//    UIImageView* enlargedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 55, 300, 395)];
//    
//    enlargedImageView.image = [UIImage imageNamed:@"testImage.jpg"];
//    
//    [self.view addSubview:enlargedImageView];
    
    imageFullScreenVC* fullImage = [[imageFullScreenVC alloc] init];
    
    fullImage.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentModalViewController:fullImage animated:YES];
    
    [fullImage release];
    
}


-(IBAction)onPackagingButton:(id)sender
{
    [self.productInfoWebView setHidden:YES];
    [self.gradesButton setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1]];
    [self.packagingButton setBackgroundColor:[UIColor whiteColor]];
    //self.packagingButton.titleLabel.textColor = [UIColor blackColor];
    [self.packagingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.gradesButton.titleLabel.textColor = [UIColor whiteColor];
    [self.packagingView setHidden:NO];
    
    [self.userOptionsTable setFrame:CGRectMake(0, 450, 320, 300)];
}

-(IBAction)onGradesButtonClicked:(id)sender
{
    [self.packagingView setHidden:YES];
    [self.productInfoWebView setHidden:NO];
    
    [self.packagingButton setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1]];
    [self.gradesButton setBackgroundColor:[UIColor whiteColor]];
    
    self.packagingButton.titleLabel.textColor = [UIColor whiteColor];
    self.gradesButton.titleLabel.textColor = [UIColor blackColor];
    
    [self.userOptionsTable setFrame:CGRectMake(0, 800, 320, 300)];
}


#pragma mark TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    // NSLog(@"array count is %d",[dataSourceArray count]);
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10; // you can have your own choice, of course
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return [headerView autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	DefaultTableCell *cell = (DefaultTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		// Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DefaultTableCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.accessoryView = nil;
	}
    // Set up the cell...
    [self configureCell:cell atIndexPath:indexPath];
	return cell;
}

- (void)configureCell:(DefaultTableCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
     cell.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_item_bg@2x.png"]] autorelease];
    UIView* tempSelectionView = [[UIView alloc] init];
    
    tempSelectionView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    
    [cell setSelectedBackgroundView:[tempSelectionView autorelease]];
    
    if(indexPath.section == 0)
    {
        cell.optionLabel.text = @"MSDS";
        cell.optionsIcon.image = [UIImage imageNamed:@"msds_download"];
    }
    
    else if(indexPath.section == 1)
    {
        cell.optionLabel.text = @"Specifications";
         cell.optionsIcon.image = [UIImage imageNamed:@"msds_download"];
    }
        
    else
    {
        cell.optionLabel.text = @"Contact Us/ Order Now";
         cell.optionsIcon.image = [UIImage imageNamed:@"callus"];
    }
        
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark DataSource Callbacks

-(void)didStartDownloadingFile
{
    fetchingResultsAlert = [[UIAlertView alloc] initWithTitle:@"Downloading File" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    loading.frame=CGRectMake(125, 50, 36, 36);
    [loading startAnimating];
    [fetchingResultsAlert addSubview:loading];
    
    [loading release];
    
    [fetchingResultsAlert show];
}

-(void)dataSourceDidDownloadFile
{
    [fetchingResultsAlert dismissWithClickedButtonIndex:0 animated:YES];
    
    [self viewDocument];
    
}

-(void)dataSourceDidFailToDownload:(NSString*)error
{
    //throw error
    
    [Utilities showAlertOKWithTitle:@"Error Downloading File!!!" withMessage:error];
}



@end

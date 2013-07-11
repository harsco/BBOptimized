//
//  contactUSVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/28/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "contactUSVC.h"

@interface contactUSVC ()

@end

@implementation contactUSVC
@synthesize contactsList,isProducts;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isProducts = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    LocationManager* locManager = [[LocationManager alloc] init];
    
    contactLocationsArray = [[locManager getAllLocations] retain];
    
    [locManager release];
    
    self.title = @"Contact Us";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 120, 30)];
    [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:@"Contact Us"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.navigationItem setTitleView:label];
    [label release];
    
    if(!isProducts)
    {
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
        self.navigationController.navigationBar.topItem.leftBarButtonItem = backButton;
        
    }
    
    
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSIndexPath *tableSelection = [self.contactsList indexPathForSelectedRow];
    [self.contactsList deselectRowAtIndexPath:tableSelection animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Action Methods
-(void)onBackClick:(id)sender
{
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
            
        }
    }
    
    [mailController release];
}


#pragma mark Mail Composer Delegate

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    //[controller dismissModalViewControllerAnimated:YES];
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark TableView Methods



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contactLocationsArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        //NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Default_TableCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        //  cell = [topLevelObjects objectAtIndex:0];
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] autorelease];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.accessoryView = nil;
    }
    // Set up the cell...
    [self configureCell:cell atIndexPath:indexPath];
    
    
    
    return cell;
}



- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    UIImageView* accessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 17, 11, 17)];
    accessoryView.image = [UIImage imageNamed:@"arrow"];
    [cell addSubview:[accessoryView autorelease]];
    
    UIView* tempSelectionView = [[UIView alloc] init];
    
    tempSelectionView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    
    
  
    
    [cell setSelectedBackgroundView:[tempSelectionView autorelease]];
    
    cell.textLabel.text = [[contactLocationsArray objectAtIndex:indexPath.row] city];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%@%@%@",[[contactLocationsArray objectAtIndex:indexPath.row] city],@", ",[(Location*)[contactLocationsArray objectAtIndex:indexPath.row] state]] ;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@%@%@",[(Location*)[contactLocationsArray objectAtIndex:indexPath.row] state],@",",[(Location*)[contactLocationsArray objectAtIndex:indexPath.row] city]] ;
    
    if(indexPath.row%2 != 0)
    {
          //cell.contentView.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:219.0/255.0 blue:209.0/255.0 alpha:1];
        cell.contentView.backgroundColor = GETTABLECELLBACKGROUND;
        
    }
    else
    {
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
        cell.backgroundColor = [UIColor clearColor];
        [cell setBackgroundView:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocationDetailsVC* contactUsDetails = [[LocationDetailsVC alloc] initWithLocation:[contactLocationsArray objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:contactUsDetails animated:YES];
    
    [contactUsDetails release];
}


@end

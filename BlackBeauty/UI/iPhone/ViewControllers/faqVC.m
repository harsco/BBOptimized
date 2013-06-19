//
//  faqVC.m
//  BlackBeauty
//
//  Created by Mahi on 4/15/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "faqVC.h"

@interface faqVC ()

@end

@implementation faqVC
@synthesize faqListView;

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
    
    UIImage* image = [UIImage imageNamed:@"grid"];
    CGRect frameimg = CGRectMake(0, 0, 25, 25);
    
    UIButton *button = [[UIButton alloc] initWithFrame:frameimg];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBackClick:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setShowsTouchWhenHighlighted:YES];
    
    self.title = @"FAQ";
    
    UIBarButtonItem *backButton =[[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    
    self.navigationController.navigationBar.topItem.leftBarButtonItem = backButton;
    
    faqArray = [[NSMutableArray alloc] init];
    [self prepareFAQData];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSIndexPath *tableSelection = [self.faqListView indexPathForSelectedRow];
    [self.faqListView deselectRowAtIndexPath:tableSelection animated:NO];
    
    if(IsRunningTallPhone())
    {
        [self.faqListView setFrame:CGRectMake(0, 20, 320, 400)];
    }
}


-(void)viewDidUnload
{
    self.faqListView = nil;
}

-(void)dealloc
{
    [faqListView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [faqListView release];
}


#pragma mark class methods

-(void)prepareFAQData
{
    for(int i=0;i<6;i++)
    {
        FAQ* faqObject = [[FAQ alloc] init];
        
        if(i==0)
        {
            faqObject.question = @"How do I order BLACK BEAUTY abrasives?";
            faqObject.answer = @"faq1";
        }
        else if(i==1)
        {
            faqObject.question = @"Where can I purchase BLACK BEAUTY abrasives?";
            faqObject.answer = @"faq2";
        }
        else if(i==2)
        {
            faqObject.question = @"Where can I find a MSDS for BLACK BEAUTY abrasives?";
            faqObject.answer = @"faq3";
        }
        else if(i==3)
        {
            faqObject.question = @"Where can I find a profile guide?";
            faqObject.answer = @"faq4";
        }
        else if(i==4)
        {
            faqObject.question = @"Where can I find pricing?";
            faqObject.answer = @"faq5";
        }
        else if(i==5)
        {
            faqObject.question = @"Who is Harsco?";
            faqObject.answer = @"faq6";
        }
        
        [faqArray addObject:faqObject];
        
        [faqObject release];
        
    }


}

#pragma mark Action Methods
-(void)onBackClick:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark Table View Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [faqArray count];
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
    UIImageView* accessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(309, 22, 11, 15)];
    accessoryView.image = [UIImage imageNamed:@"arrow"];
    [cell addSubview:[accessoryView autorelease]];
    
    UIView* tempSelectionView = [[UIView alloc] init];
    
    tempSelectionView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    
    
    [cell setSelectedBackgroundView:[tempSelectionView autorelease]];
    
    cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:11];
    
    //cell.textLabel.font = [UIFont boldSystemFontOfSize:11.0];
    
    cell.textLabel.text = [[faqArray objectAtIndex:indexPath.row] question];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%@%@%@",[[contactLocationsArray objectAtIndex:indexPath.row] city],@", ",[(Location*)[contactLocationsArray objectAtIndex:indexPath.row] state]] ;
    
    if(indexPath.row%2 != 0)
    {
       // cell.contentView.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:219.0/255.0 blue:209.0/255.0 alpha:1];
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
    
        faqDetailsVC* faqInfoScreen = [[faqDetailsVC alloc] initWithFAQ:[faqArray objectAtIndex:indexPath.row]];
        
        [self.navigationController pushViewController:faqInfoScreen animated:YES];
        
        [faqInfoScreen release];
    
}


@end

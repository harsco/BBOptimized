//
//  StoreHoursVC.m
//  BlackBeauty
//
//  Created by Mahi on 6/10/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "StoreHoursVC.h"

@interface StoreHoursVC ()

@end

@implementation StoreHoursVC
@synthesize officeHours,loadingHours,hoursTable,defaultLabel,hoursSegment,winterHoursLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithLocation:(Location*)locationToBeShown
{
    if(self = [super init])
    {
        location = [locationToBeShown retain];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.officeHours.titleLabel.text = [NSString stringWithFormat:@"%@%@",@"Office Hours: ",location.officeHours];
    //self.loadingHours.titleLabel.text = [NSString stringWithFormat:@"%@%@",@"Loading Hours:",location.loadingHours];
    //[self.loadingHours setTitle:[NSString stringWithFormat:@"%@%@",@"Office Hours: ",location.officeHours] forState:UIControlStateNormal];
    
    //[self.loadingHours setTitle:[NSString stringWithFormat:@"%@%@",@"Loading Hours: ",location.loadingHours] forState:UIControlStateNormal];
    
    self.title = location.name;
   // self.hoursSegment addTarget:self action:@selector(segmentAction:) forControlEvents:<#(UIControlEvents)#>
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSLog(@"loading is %@",location.loadingHours);
    
    if(!IsRunningTallPhone())
    {
        [self.hoursTable setFrame:CGRectMake(10.0, 56.0, 300, 380)];
    }
    
    if(!([location.officeHours length] && [location.loadingHours length]))
    {
        NSLog(@"loading is %@",location.loadingHours);
        [self.hoursSegment setHidden:YES];
    }
    
    if([location.weekdayHours isEqualToString:@"Hours Not Available"])
    {
        [self.hoursTable setHidden:YES];
        [self.defaultLabel setHidden:NO];
        self.defaultLabel.text = [NSString stringWithFormat:@"%@%@%@",@"Hours Not Available! Please call  ",location.telephone,@" to find out further details"];
    }
    else
    {
        [self.hoursTable setHidden:NO];
        [self.defaultLabel setHidden:YES];
    }
    
    
    if([location.name isEqualToString:@"Advanced On-Site Concrete"])
    {
        [self.winterHoursLabel setHidden:NO];
        self.winterHoursLabel.text = @"Winter: Monday-Saturday 7:00am - 3:30pm CST Sunday: Closed";
    }
    else if([location.name isEqualToString:@"Columbus Builders Supply"])
    {
        [self.winterHoursLabel setHidden:NO];
        self.winterHoursLabel.text = @"Winter: Monday-Saturday 7:30am - 4:30pm EST Sat & Sun: Closed";
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action Methods
-(void)segmentAction:(UISegmentedControl*)sender
{
    
    if(sender.selectedSegmentIndex == 0)
    {
        
        [self.hoursTable reloadData];
    }
    
    else if(sender.selectedSegmentIndex == 1)
    {
        [self.hoursTable reloadData];
    }
    
    
}


#pragma mark TableView Methods



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
    static NSString *CellIdentifier = @"Cell";
	StoreHoursCell *cell = (StoreHoursCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		// Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"StoreHoursCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
		//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.accessoryView = nil;
	}
    // Set up the cell...
    [self configureCell:cell atIndexPath:indexPath];
	return cell;}



- (void)configureCell:(StoreHoursCell *)cell atIndexPath:(NSIndexPath *)indexPath
{

//    if(indexPath.row == 5)
//    {
//        cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"Saturday      ",location.saturdayHours];
//    }
//    else if(indexPath.row == 6)
//    {
//        cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"Sunday      ",location.sundayHours];
//    }
//    else
//    cell.textLabel.text = location.weekdayHours;
    
   // cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
    
    switch (indexPath.row) {
        case 0:
            if(hoursSegment.selectedSegmentIndex == 1)
                cell.workingHoursLabel.text = location.loadingHours;
                
            else
            cell.workingHoursLabel.text = location.weekdayHours;
            
            cell.dayLabel.text = @"Monday";
            break;
            case 1:
            if(hoursSegment.selectedSegmentIndex == 1)
                cell.workingHoursLabel.text = location.loadingHours;
            else
            cell.workingHoursLabel.text = location.weekdayHours;
            
            cell.dayLabel.text = @"Tuesday";
            break;
        case 2:
            if(hoursSegment.selectedSegmentIndex == 1)
                cell.workingHoursLabel.text = location.loadingHours;
            else
            cell.workingHoursLabel.text = location.weekdayHours;
            cell.dayLabel.text = @"Wednesday";
            break;
        case 3:
            if(hoursSegment.selectedSegmentIndex == 1)
                cell.workingHoursLabel.text = location.loadingHours;
            else
            cell.workingHoursLabel.text = location.weekdayHours;
            cell.dayLabel.text = @"Thursday";
            break;
        case 4:
            if(hoursSegment.selectedSegmentIndex == 1)
                cell.workingHoursLabel.text = location.loadingHours;
            else
            cell.workingHoursLabel.text = location.weekdayHours;
            cell.dayLabel.text = @"Friday";
            break;
        case 5:
            cell.workingHoursLabel.text = location.saturdayHours;
            cell.dayLabel.text = @"Saturday";
            break;
        case 6:
            cell.workingHoursLabel.text = location.sundayHours;
            cell.dayLabel.text = @"Sunday";
            break;
            
        default:
            break;
    }
    
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%@%@%@",[[contactLocationsArray objectAtIndex:indexPath.row] city],@", ",[(Location*)[contactLocationsArray objectAtIndex:indexPath.row] state]] ;
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%@%@%@",[(Location*)[contactLocationsArray objectAtIndex:indexPath.row] state],@",",[(Location*)[contactLocationsArray objectAtIndex:indexPath.row] city]] ;
    
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


@end

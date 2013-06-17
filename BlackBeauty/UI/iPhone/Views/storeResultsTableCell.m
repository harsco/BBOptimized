//
//  storeResultsTableCell.m
//  BlackBeauty
//
//  Created by Mahi on 5/22/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "storeResultsTableCell.h"

@implementation storeResultsTableCell
@synthesize storeName,storeAddress,storeContactNumber,storeDistance;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    //[self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIView* tempSelectionView = [[UIView alloc] init];
    
    tempSelectionView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    
    [self setSelectedBackgroundView:[tempSelectionView autorelease]];
}

@end

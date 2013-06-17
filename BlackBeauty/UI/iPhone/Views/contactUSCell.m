//
//  contactUSCell.m
//  BlackBeauty
//
//  Created by Mahi on 5/24/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "contactUSCell.h"

@implementation contactUSCell
@synthesize cellIcon,cellLabel;

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
    UIView* tempSelectionView = [[UIView alloc] init];
    
    tempSelectionView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:132.0/255.0 blue:38.0/255.0 alpha:1];
    
    [self setSelectedBackgroundView:[tempSelectionView autorelease]];

}

@end

//
//  contactUSCell.h
//  BlackBeauty
//
//  Created by Mahi on 5/24/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contactUSCell : UITableViewCell
{
    UIImageView* cellIcon;
    UILabel* cellLabel;
}


@property(nonatomic,retain)IBOutlet UIImageView* cellIcon;
@property(nonatomic,retain)IBOutlet UILabel* cellLabel;

@end

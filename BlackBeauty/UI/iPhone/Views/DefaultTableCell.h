//
//  DefaultTableCell.h
//  Rail Paper Less
//
//  Created by SadikAli on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefaultTableCell : UITableViewCell
{
     IBOutlet UILabel* optionLabel;
     IBOutlet UIImageView* optionsIcon;
    
    
}

@property(nonatomic,retain)IBOutlet UILabel* optionLabel;
@property(nonatomic,retain)IBOutlet UIImageView* optionsIcon;


@end

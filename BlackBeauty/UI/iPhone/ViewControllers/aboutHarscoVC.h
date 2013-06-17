//
//  aboutHarscoVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/29/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aboutHarscoVC : UIViewController
{
    UINavigationBar* aboutUsHeader;
    
}
@property(nonatomic,retain)IBOutlet UINavigationBar* aboutUsHeader;

-(IBAction)onDoneClicked:(id)sender;

@end

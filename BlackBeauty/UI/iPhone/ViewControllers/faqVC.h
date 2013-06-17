//
//  faqVC.h
//  BlackBeauty
//
//  Created by Mahi on 4/15/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "faqDetailsVC.h"
#import "FAQ.h"

@interface faqVC : UIViewController
{
   
    IBOutlet UITableView* faqListView;
    
    NSMutableArray* faqArray;
}

@property(nonatomic,retain)IBOutlet UITableView* faqListView;

@end

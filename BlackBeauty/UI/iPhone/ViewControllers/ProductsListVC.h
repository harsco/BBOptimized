//
//  ProductsListVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/16/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBOriginalProductInfoVC.h"
#import "BBGlassProductInfoVC.h"
#import "BBIronProductInfoVC.h"

@interface ProductsListVC : UIViewController<UINavigationControllerDelegate>
{
     IBOutlet UINavigationBar* headerView;
}


@property(nonatomic,retain)IBOutlet UINavigationBar* headerView;

-(IBAction)onBBOriginalClicked:(id)sender;
-(IBAction)onBBGlassClicked:(id)sender;
-(IBAction)onBBIronClicked:(id)sender;

@end

//
//  EULAVCViewController.h
//  BlackBeauty
//
//  Created by Mahi on 7/9/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScreenVC.h"

@interface EULAVCViewController : UIViewController
{
    UIWebView* eulaView;
    UIView* acceptView;
    UIButton* acceptButton;
}


@property(nonatomic,retain)IBOutlet UIWebView* eulaView;
@property(nonatomic,retain)IBOutlet UIView* acceptView;
@property(nonatomic,retain)IBOutlet UIButton* acceptButton;

-(IBAction)onEULAButtonClicked:(id)sender;

@end

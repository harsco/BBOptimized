//
//  faqDetailsVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FAQ.h"
#import <MessageUI/MessageUI.h>
#import "Utilities.h"

@interface faqDetailsVC : UIViewController<UIWebViewDelegate,MFMailComposeViewControllerDelegate>
{
    UIWebView* faqAnswerView;
    UIView* faqQuestionView;
    UILabel* faqQuestion;
    UIButton* callUSButton;
    UIButton* emailUSButton;
    UIImageView* callImage;
    UIImageView* emailImage;
    UIActivityIndicatorView* loadingIndicator;
    UILabel *label;
    
    BOOL didShowEmail;
    
    FAQ* faqToBeShown;
    NSURL* savedLink;
}

@property(nonatomic,retain)IBOutlet UIWebView* faqAnswerView;
@property(nonatomic,retain)IBOutlet UILabel* faqQuestion;
@property(nonatomic,retain)IBOutlet UIView* faqQuestionView;
@property(nonatomic,retain)IBOutlet UIButton* callUSButton;
@property(nonatomic,retain)IBOutlet UIButton* emailUSButton;
@property(nonatomic,retain)IBOutlet UIImageView* callImage;
@property(nonatomic,retain)IBOutlet UIImageView* emailImage;
@property(nonatomic,retain)IBOutlet UIActivityIndicatorView* loadingIndicator;
@property(nonatomic,retain)FAQ* faqToBeShown;


-(IBAction)onCallUsClicked:(id)sender;
-(IBAction)onEmailUsClicked:(id)sender;
-(id)initWithFAQ:(FAQ*)faqObject;

@end

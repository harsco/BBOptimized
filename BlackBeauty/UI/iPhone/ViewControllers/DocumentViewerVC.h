//
//  DocumentViewerVC.h
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "Utilities.h"


@interface DocumentViewerVC : UIViewController<UIWebViewDelegate,MFMailComposeViewControllerDelegate,UIDocumentInteractionControllerDelegate,UIActionSheetDelegate>
{
    UIWebView* documentViewer;
    IBOutlet UIActivityIndicatorView* loadingIndicator;
    NSString* filePathToBeRendered;
    
    BOOL isProfileGuide;
    BOOL isTOS;
    BOOL isPrivacyPolicy;
}

@property(nonatomic,retain) IBOutlet UIWebView* documentViewer;
@property(nonatomic,retain)UIActivityIndicatorView* loadingIndicator;
@property(nonatomic)BOOL isProfileGuide;
@property(nonatomic)BOOL isTOS;
@property(nonatomic)BOOL isPrivacyPolicy;
-(id)initWithFilePath:(NSString*)filePath;

@end

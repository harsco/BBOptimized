//
//  imageFullScreenVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/21/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageFullScreenVC : UIViewController<UIScrollViewDelegate>
{
    UIScrollView* imageScrollView;
    UIImageView* fullSizeImageView;
    UIImage* fullScreenImage;
}

@property(nonatomic,retain)IBOutlet UIScrollView* imageScrollView;
@property(nonatomic,retain)IBOutlet UIImageView* fullSizeImageView;

-(id)initWIthImage:(UIImage*)image;

@end

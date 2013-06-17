//
//  FAQ.h
//  BlackBeauty
//
//  Created by Mahi on 5/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAQ : NSObject
{
    NSString* question;
    NSString* answer;
    
}

@property(nonatomic,retain)NSString* question;
@property(nonatomic,retain)NSString* answer;


@end

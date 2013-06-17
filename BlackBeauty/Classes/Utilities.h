//
//  Utilities.h
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject
{
    
}


+(Utilities*)getInstance;

-(BOOL)isFileExists:(NSString*)filename;
+(void)showAlertOKWithTitle:(NSString*)title withMessage:(NSString*)message;

@end

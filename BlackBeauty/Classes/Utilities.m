//
//  Utilities.m
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+(Utilities*)getInstance
{
    static Utilities* instance;
    @synchronized(self)
    {
        if(!instance)
        {
            instance = [[Utilities alloc] init];
        }
    }
    
    return instance;
}

-(BOOL)isFileExists:(NSString*)filename
{
    
    NSLog(@"file name is %@",filename);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *resourceDocPath = [[NSString alloc] initWithString:[[[[NSBundle mainBundle]  resourcePath] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Documents"]];
    
    NSString *filePath = [resourceDocPath stringByAppendingPathComponent:filename];
    [resourceDocPath release];
    
    
    if ([fileManager fileExistsAtPath:filePath])
    {
        return YES;
    }
    return NO;
}

+(void)showAlertOKWithTitle:(NSString*)title withMessage:(NSString*)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    
}

@end

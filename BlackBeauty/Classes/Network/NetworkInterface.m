//
//  NetworkInterface.m
//  Rail Paper Less
//
//  Created by SadikAli on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NetworkInterface.h"

@implementation NetworkInterface

+(NetworkInterface*)getInstance
{
    static NetworkInterface* instance;
    @synchronized(self)
    {
        if(!instance)
        {
            instance = [[NetworkInterface alloc] init];
        }
    }
    
    return instance;
}

-(BOOL)isWiFiOn
{
    reachability = [[Reachability reachabilityForLocalWiFi] retain];
    
    if([reachability currentReachabilityStatus] == ReachableViaWiFi)
    {
        return YES;
    }
    
    return NO;
}

-(BOOL)isInternetAvailable
{
    reachability = [[Reachability reachabilityForInternetConnection] retain];
    
    if([reachability currentReachabilityStatus] == NotReachable)
    {
        return NO;
    }
    
    return YES;
}

@end

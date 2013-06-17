//
//  DataDownloadOperation.m
//  Rail Paper Less
//
//  Created by SadikAli on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataDownloadOperation.h"

@implementation DataDownloadOperation
@synthesize delegate;
@synthesize postData;


- (id)initWithURL:(NSURL *)url
{
    if( (self = [super init]) ) {
        connectionURL = [url copy];
        receivedData = [[NSMutableData alloc] init];
        
      
        //NSLog(@"URL is %@",connectionURL);
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
    
    [receivedData release];
    [postData release];
}

-(void)start
{
    if( finished_ || [self isCancelled] ) { //[self done]; 
        return; }
    
    [self performSelectorOnMainThread:@selector(initiateNetworkConnection) withObject:nil waitUntilDone:NO];
    
    
}



-(void)initiateNetworkConnection
{
    
 
                      
    
   // NSString* temp = [NSString stringWithFormat:@"%@",@"<?xml version='1.0' encoding='UTF-8'?><Getorders><user>"];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:connectionURL
														   cachePolicy:NSURLRequestReloadIgnoringLocalCacheData 
													   timeoutInterval:60];
    
//    NSString* requestDataLengthString = [NSString stringWithFormat:@"%d", [self.postData length]];
//    [request addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    
//    //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPMethod:@"POST"];
//    [request setValue:requestDataLengthString forHTTPHeaderField:@"Content-Length"];		
//    [request setHTTPBody:[self.postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}


-(void)finish
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(didDownloadData:)])
    {
        [delegate didDownloadData:receivedData];
    }
}


#pragma mark network Call backs

#pragma mark NSURL
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [receivedData setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //NSLog(@"data bytes is %s",[data bytes]);
    [receivedData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    //[connection release];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(didFailDownloadData:)])
    {
        [delegate didFailDownloadData:error];
    }
}

- (NSCachedURLResponse *) connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    return nil;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    //[connection release];
    //[self movieReceived];
    NSLog(@"data is %s",[receivedData bytes]);
    
    [self finish];
    
}



@end

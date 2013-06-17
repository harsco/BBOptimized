//
//  DataSource.m
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource
@synthesize delegate;

-(void)downloadMSDSFileForProduct:(PRODUCTTYPE)type
{
    
    if([[NetworkInterface getInstance] isInternetAvailable])
    {
        fileType = type;
        NSOperationQueue* testQueue = [[NSOperationQueue alloc] init];
        [testQueue setMaxConcurrentOperationCount:1];
        DataDownloadOperation* loginOp;
        
        if(type == BBOriginal)
        {
            loginOp = [[DataDownloadOperation alloc] initWithURL:[NSURL URLWithString:BBORIGINALURL]];
            loginOp.delegate = self;
            [testQueue addOperation:loginOp];
        }
         
        else if(type == BBGlass)
        {
            loginOp = [[DataDownloadOperation alloc] initWithURL:[NSURL URLWithString:BBGLASSURL]];
            loginOp.delegate = self;
            [testQueue addOperation:loginOp];
        }
          
        else
        {
            loginOp = [[DataDownloadOperation alloc] initWithURL:[NSURL URLWithString:BBIRONURL]];
            loginOp.delegate = self;
            [testQueue addOperation:loginOp];
        }
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(didStartDownloadingFile)])
        {
            [delegate didStartDownloadingFile];
        }
        
    }
    else
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(dataSourceDidFailToDownload:)])
        {
            [delegate dataSourceDidFailToDownload:NETWORKERRORMESSAGE];
        }
    }
}


#pragma marks datadownload callbacks
-(void)didDownloadData:(NSData *)downloadedData
{
    NSString *resourceDocPath = [[NSString alloc] initWithString:[[[[NSBundle mainBundle]  resourcePath] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Documents"]];
    NSString *filePath=@"";
    
    if(fileType == BBOriginal)
    {
         filePath = [resourceDocPath stringByAppendingPathComponent:BBORIGINAL];
         
    }
    else if(fileType == BBGlass)
    {
        filePath = [resourceDocPath stringByAppendingPathComponent:BBGLASS];
    }
    else if(fileType == BBIron)
    {
        filePath = [resourceDocPath stringByAppendingPathComponent:BBIRON];
    }
    
   // NSString *filePath = [resourceDocPath stringByAppendingPathComponent:@"myPDF.pdf"];
    
    [resourceDocPath release];
    
    [downloadedData writeToFile:filePath atomically:YES];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(dataSourceDidDownloadFile)])
    {
        [delegate dataSourceDidDownloadFile];
    }
}

-(void)didFailDownloadData:(NSError *)error
{
    NSLog(@"error downloading");
    //[delegate dataSourceOrderListDidFail:error];
    if(self.delegate && [self.delegate respondsToSelector:@selector(dataSourceDidFailToDownload:)])
    {
        [delegate dataSourceDidFailToDownload:[error localizedDescription]];
    }
}


@end

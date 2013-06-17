//
//  DataSource.h
//  BlackBeauty
//
//  Created by Mahi on 6/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataDownloadOperation.h"
#import "NetworkInterface.h"

@protocol dataSourceDelegate;

@interface DataSource : NSObject<dataDownloadOperationDelegate>
{
    id <dataSourceDelegate> delegate;
    NSInteger fileType;
}

@property(nonatomic,retain)id<dataSourceDelegate>delegate;

-(void)downloadMSDSFileForProduct:(PRODUCTTYPE)type;

@end

@protocol dataSourceDelegate <NSObject>

@optional

-(void)didStartDownloadingFile;
-(void)dataSourceDidDownloadFile;
-(void)dataSourceDidFailToDownload:(NSString*)error;

@end

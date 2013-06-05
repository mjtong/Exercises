//
//  NSURLConnection+NSURLConnectionSendRequestAdditions.h
//  RSSLast
//
//  Created by Maynard Tong on 6/4/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLConnection (NSURLConnectionSendRequestAdditions)
+ (NSData *)sendSynchronousRequestWithString:(NSString*)urlString error:(NSError **)error;
@end

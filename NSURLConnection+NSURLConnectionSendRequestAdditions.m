//
//  NSURLConnection+NSURLConnectionSendRequestAdditions.m
//  RSSLast
//
//  Created by Maynard Tong on 6/4/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import "NSURLConnection+NSURLConnectionSendRequestAdditions.h"

@implementation NSURLConnection (NSURLConnectionSendRequestAdditions)
+(NSData *)sendSynchronousRequestWithString:(NSString *)urlString error:(NSError *__autoreleasing *)error{
    return [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] returningResponse:nil error:error];
}
@end
